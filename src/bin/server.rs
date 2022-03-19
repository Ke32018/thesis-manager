use std::{env, net::SocketAddr};

use axum::{
    extract::Extension,
    response::Html,
    routing::{get, post},
    Router,
};
use sea_orm::Database;
use tower::ServiceBuilder;
use tower_cookies::CookieManagerLayer;

use thesis_manager::handler::*;


#[tokio::main]
async fn main() {
    env::set_var("RUST_LOG", "debug");
    tracing_subscriber::fmt::init();

    dotenv::dotenv().ok();
    let db_url = env::var("DATABASE_URL").expect("DATABASE_URL is not set in .env file");
    let host = env::var("HOST").expect("HOST is not set in .env file");
    let port = env::var("PORT").expect("PORT is not set in .env file");
    let server_url = format!("{}:{}", host, port);

    let conn = Database::connect(db_url)
        .await
        .expect("Database connection failed");

    let app = Router::new()
        .route("/", get(index_handler))
        .nest(
            "/student",
            Router::new()
                .route("/", get(student::list_student_handler))
                .route("/:id", get(student::edit_student_handler).post(student::update_student_handler)),
        )
        .layer(
            ServiceBuilder::new()
                .layer(CookieManagerLayer::new())
                .layer(Extension(conn))
                // .layer(Extension(templates)),
        );

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn index_handler() -> Html<&'static str> {
    // `std::include_str` macro can be used to include an utf-8 file as `&'static str` in compile
    // time. This method is relative to current `main.rs` file.
    Html(include_str!("../../templates/index.html"))
}

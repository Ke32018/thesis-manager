use crate::entity::t_student as student;
use axum::{
    extract::{Extension, Form, Query},
    http::StatusCode,
    response::Html,
    Json,
};
use sea_orm::{DatabaseConnection, EntityTrait, PaginatorTrait, QueryOrder};
use serde::Deserialize;
use student::Entity as Student;
use tera::Tera;

use super::flash::{post_response, PostResponse};
use super::idl::FlashData;

#[derive(Deserialize)]
pub struct Params {
    page: Option<usize>,
    posts_per_page: Option<usize>,
}

pub async fn list_student_handler(
    Extension(ref templates): Extension<Tera>,
    Extension(ref conn): Extension<DatabaseConnection>,
    Query(params): Query<Params>,
) -> Result<Html<String>, (StatusCode, &'static str)> {
    let page = params.page.unwrap_or(1);
    let posts_per_page = params.posts_per_page.unwrap_or(5);
    let paginator = Student::find()
        .order_by_asc(student::Column::Id)
        .paginate(conn, posts_per_page);

    let mut ctx = tera::Context::new();

    let body = templates
        .render("index.html.tera", &ctx)
        .map_err(|_| (StatusCode::INTERNAL_SERVER_ERROR, "Template error"))?;

    Ok(Html(body))
}

pub async fn edit_student_handler(
    Extension(ref templates): Extension<Tera>,
    Extension(ref conn): Extension<DatabaseConnection>,
    Query(params): Query<Params>,
) -> Result<Html<String>, (StatusCode, &'static str)> {
    Ok(Html("ok".to_string()))
}

pub async fn update_student_handler(
    Extension(ref templates): Extension<Tera>,
    Extension(ref conn): Extension<DatabaseConnection>,
    Query(params): Query<Params>,
) -> Result<Html<String>, (StatusCode, &'static str)> {
    Ok(Html("ok".to_string()))
}

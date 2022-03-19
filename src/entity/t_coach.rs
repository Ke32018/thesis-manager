//! SeaORM Entity. Generated by sea-orm-codegen 0.6.0

use sea_orm::entity::prelude::*;

#[derive(Clone, Debug, PartialEq, DeriveEntityModel)]
#[sea_orm(table_name = "t_coach")]
pub struct Model {
    #[sea_orm(primary_key)]
    pub id: i32,
    pub content: Option<String>,
    #[sea_orm(column_name = "Date")]
    pub date: Option<DateTime>,
    pub thesis_id: Option<i32>,
}

#[derive(Copy, Clone, Debug, EnumIter)]
pub enum Relation {}

impl RelationTrait for Relation {
    fn def(&self) -> RelationDef {
        panic!("No RelationDef")
    }
}

impl ActiveModelBehavior for ActiveModel {}

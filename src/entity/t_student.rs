//! SeaORM Entity. Generated by sea-orm-codegen 0.6.0

use sea_orm::entity::prelude::*;
use serde::{Deserialize, Serialize};


#[derive(Clone, Debug, PartialEq, DeriveEntityModel, Serialize, Deserialize)]
#[sea_orm(table_name = "t_student")]
pub struct Model {
    #[sea_orm(primary_key)]
    pub id: i32,
    pub name: String,
    pub code: String,
    pub sex: i32,
    pub phone: Option<String>,
    pub email: Option<String>,
    pub address: Option<String>,
    pub profession: Option<String>,
    pub idnumber: Option<String>,
    pub politics: Option<String>,
    pub introduction: Option<String>,
    pub thesis_id: Option<i32>,
    pub power: i32,
    pub edu_system: i32,
    pub passwd: String,
    pub class_id: Option<i32>,
    pub major_id: Option<i32>,
}

#[derive(Copy, Clone, Debug, EnumIter)]
pub enum Relation {}

impl RelationTrait for Relation {
    fn def(&self) -> RelationDef {
        panic!("No RelationDef")
    }
}

impl ActiveModelBehavior for ActiveModel {}



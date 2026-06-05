view: merchant_storefront {
  sql_table_name: `triangulation_fraud_demo.MerchantStorefront` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: storefront_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.storefront_id ;;
  }
  dimension: platform_name {
    type: string
    sql: ${TABLE}.platform_name ;;
  }
  dimension: seller_rating {
    type: number
    sql: ${TABLE}.seller_rating ;;
  }
  dimension: creation_date {
    type: date
    sql: ${TABLE}.creation_date ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: complaint_rate {
    type: number
    sql: ${TABLE}.complaint_rate ;;
  }
}

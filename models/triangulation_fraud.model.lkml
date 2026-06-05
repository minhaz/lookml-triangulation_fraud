connection: "lookerkool-demo" # Adjust connection name as needed

include: "/views/**/*.view.lkml"
include: "/dashboards/**/*.dashboard.lookml"

explore: triangulation_fraud {
  from: triangulation_fraud
}

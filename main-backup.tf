######################################
##       ❤️   👈(●‿●)👉   ❤️     ##     As i dicussed with Sunil, meanwhile this workload is not in live
##  OpenSearch/DocumentDB Workload  ##
##          (Dev/uat) Env           ##
######################################
# resource "newrelic_workload" "my_workload" {
#   name = "DocDB-OpenSearch"
#   account_id = var.acc_id_mdt_sdp
#   entity_guids = [
#     # DocumentDB
#     var.EDMS_D3_Sec.Entity_GUID,
#     var.EDMS_U1_Pri.Entity_GUID,
#     var.EDMS_D1_Pri.Entity_GUID,
#     var.EDMS_D2_Pri.Entity_GUID,
#     var.EDMS_D3_Pri.Entity_GUID,
#     var.EDMS_U2_Pri.Entity_GUID,
#     var.EDMS_D1_Sec.Entity_GUID,
#     var.CJAMS_D1_Pri.Entity_GUID,
#     var.EDMS_D2_Sec.Entity_GUID,
#     var.EDMS_U1_Sec.Entity_GUID,
#     var.R360_U1_Pri.Entity_GUID,
#     var.R360_D1_Pri.Entity_GUID,
#     var.DP_D1_Pri.Entity_GUID,
    
#     # OpenSearch
#     var.r360_edms_D1_Pri.Entity_GUID,
#     var.r360_edms_U1_Pri.Entity_GUID,
#     var.auditLog_edms_D1_Pri.Entity_GUID,
#     var.auditLog1_dp_D1_Pri.Entity_GUID,
#   ]
# }


################################
##   💞   👈(●‿●)👉   💞   ##     As i dicussed with Sunil, meanwhile this workload is not in live
##   EC2 Instances Workload   ##
##      ALL Environment       ##
################################
# resource "newrelic_workload" "ec2_workload" {
#   name = "EC2-WorkLoad"
#   account_id = var.acc_id_mdt_sdp
#   entity_guids = [
#     # MDM-APP-Server (Dev/Prod)
#     var.ec2_mdm_app_dev.Entity_GUID,
#     var.ec2_mdm_app_dev_enhans.Entity_GUID,
#     var.ec2_mdm_app_uat_node1.Entity_GUID,
#     var.ec2_mdm_app_uat_node2.Entity_GUID,
#     var.ec2_mdm_app_uat_enhans.Entity_GUID,
#     var.ec2_mdm_app_stage_node1.Entity_GUID,
#     var.ec2_mdm_app_stage_node2.Entity_GUID,
#     var.ec2_mdm_app_stage_enhans.Entity_GUID,
#     var.ec2_mdm_app_prod_node1.Entity_GUID,
#     var.ec2_mdm_app_prod_node2.Entity_GUID,
#     # SQL Server "NEW" (Dev/Prod)
#     var.ec2_sdp_sql_dev.Entity_GUID,
#     var.ec2_sdp_sql_dev_enhans.Entity_GUID,
#     var.ec2_sdp_sql_uat_pri.Entity_GUID,
#     var.ec2_sdp_sql_uat_sec.Entity_GUID,
#     var.ec2_sdp_sql_stage_pri.Entity_GUID,
#     var.ec2_sdp_sql_stage_sec.Entity_GUID,
#     var.ec2_sdp_sql_prod_pri.Entity_GUID,
#     var.ec2_sdp_sql_prod_sec.Entity_GUID,
#     var.ec2_sdp_sql_uat_enhans.Entity_GUID,
#     # SQL Server "OLD" (Dev/Prod)
#     var.ec2_mdm_sql_sanbox1.Entity_GUID,
#     var.ec2_mdm_sql_sanbox2.Entity_GUID,
#     var.ec2_mdm_sql_uat_sec1.Entity_GUID,
#     var.ec2_mdm_sql_uat_sec2.Entity_GUID,
#     var.ec2_mdm_sql_stage_pri.Entity_GUID,
#     var.ec2_mdm_sql_stage_sec.Entity_GUID,
#     var.ec2_mdm_sql_prod_pri.Entity_GUID,
#     var.ec2_mdm_sql_prod_sec.Entity_GUID
#   ]
# }
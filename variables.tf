# ❤️ AccountID MDT-SDP
variable "acc_id_mdt_sdp" {
  description = "Dev and uat environment suffix value"
  type = string
  default = "2469734"  
}

# AccountID MDT-SDP-Prod
variable "acc_id_mdt_sdp_prod" {
  description = "MDT-SDP-Prod environment suffix value"
  type = string
  default = "2469737"  
}


# ❤️ DEV Suffix name Globally
variable "suffix_dev" {
  description = "Dev and uat environment suffix value"
  type = string
  default = "(DEV)"  
}
# Prod Suffix name Globally
variable "suffix_prod" {
  description = "Stage and Prod environment suffix value"
  type = string
  default = "(Prod)"  
}

####################################################
# Common "Environment" Tag for DEV/UAT/STAGE/PROD
variable "tag_env_dev" {
  type    = list(string)
  default = ["Environment", "DEV/UAT"]
}
variable "tag_env_prod" {
  type    = list(string)
  default = ["Environment", "Stage/Prod"]
}

####################################################
# ❤️ Common "ServiceName" Tag for "DocumentDB" DEV/UAT
variable "tag_service_ddb_dev" {
  type    = list(string)
  default = ["Services", "DocumentDB"]
}
# ❤️ Common "ServiceName" Tag for "OpenSearch" DEV/UAT
variable "tag_service_es_dev" {
  type    = list(string)
  default = ["Services", "OpenSearch"]
}

####################################################
# ❤️ Common "ClusterName" Tag for "DocumentDB" DEV/UAT
variable "tag_DocDB_ClusterName_dev" {
  type    = list(string)
  default = ["ClusterName"]
}

####################################################
# Common "EC2-Instance" Tag for "Infomatic/MDM/SDP" DEV/UAT/STAGE/PROD
variable "tag_ec2_name" {
  type    = list(string)
  default = ["InstanceName"]
}

####################################################
# ❤️ Common "Application-R360" Tag for "DocumentDB" DEV/UAT
variable "tag_app_r360" {
  type    = list(string)
  default = ["Application", "R360"]
}
# ❤️ Common "Application-EDMS" Tag for "DocumentDB" DEV/UAT
variable "tag_app_edms" {
  type    = list(string)
  default = ["Application", "EDMS"]
}
# ❤️ Common "Application-CJAMS" Tag for "DocumentDB" DEV/UAT
variable "tag_app_cjams" {
  type    = list(string)
  default = ["Application", "CJAMS"]
}
# ❤️ Common "Application-DataPortal" Tag for "DocumentDB" DEV/UAT
variable "tag_app_dp" {
  type    = list(string)
  default = ["Application", "DataPortal"]
}
# Common "Application-MDM" Tag for DEV/UAT/STAGE/PROD
variable "tag_app_mdm" {
  type    = list(string)
  default = ["Application", "MDM"]
}
# Common "Application-SDP" Tag for DEV/UAT/STAGE/PROD
variable "tag_app_sdp" {
  type    = list(string)
  default = ["Application", "SDP"]
}





##################################
##        👈(●‿●)👉           ##
##  ❤️ DocumentDB Clusters ❤️  ##     🔗 Total 13 CLUSTERS
##          (DEV/UAT)           ## 
##################################
#DocumentDB DEV/UAT Clusters(13) and Instances Details
variable "EDMS_D3_Sec" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-Dev3-Sec-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-ecms-d3-sec-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtMTcxNDYyOTUxNjU2MjQxMzA3NA"
  }
}
variable "EDMS_U1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-UAT1-Pri-DocDB"
    Entity_Name  = "mdt-sdp-dlke-e1-u1-dhs-sds-edms-ddb"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXw1MzExNjg4NjcyOTM4NjA4NDYw"
  }
}
variable "EDMS_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-Dev1-Pri-DocDB"
    Entity_Name  = "mdt-sdp-dlke-e1-d1-dhs-sds-edms-ddb"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtNTgwOTQ4NDkwNjEwNjg4ODU1Nw"
  }
}
variable "EDMS_D2_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-Dev2-Pri-DocDB"
    Entity_Name  = "mdt-sdp-dlke-e1-d2-dhs-sds-edms-ddb"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXw3NjQwNzUyMTI1ODUzNjgyODY0"
  }
}
variable "EDMS_D3_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-Dev3-Pri-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-ecms-d3-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtMTk3NTI4NTUxNjE1NDQ3NDA4MA"
  }
}
variable "EDMS_U2_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-UAT2-Pri-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-ecms-u2-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtNTM3MzgwMTM0NDY4NDY2MzM4MQ"
  }
}
variable "EDMS_D1_Sec" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-Dev1-Sec-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-ecms-d1-sec-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwxMzAxOTM4NDAzMTQyMTYyMzU2"
  }
}
variable "CJAMS_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "CJAMS-Dev1-Pri-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-cjams-forms-d1-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtMTE3MTkxOTk0MzYwNTQxMTMyMw"
  }
}
variable "EDMS_D2_Sec" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-Dev2-Sec-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-ecms-d2-sec-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtODUyNjI3NjA4NDMwNzE4NjU2Nw"
  }
}
variable "EDMS_U1_Sec" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "EDMS-UAT1-Sec-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-ecms-u1-sec-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXw0NzY2MDk3MDM1ODE0ODkwNDAz"
  }
}
variable "R360_U1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "R360-UAT1-Pri-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-r360-u1-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtNTU4ODY2NDQzOTUwNzI3MDgyNg"
  }
}
variable "R360_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "R360-Dev1-Pri-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-r360-d1-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXw3NDI4MzAyMzExNjAwMzAyOTEw"
  }
}
variable "DP_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "DataPortal-Dev1-Pri-DocDB"
    Entity_Name  = "ddb-ssdpe1-mdt-data-portal-d1-cluster"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtODY2MzMyNDIyNTI5NTE1ODkxMg"
  }
}





##################################
##        👈(●‿●)👉           ##
##  ❤️ OpenSearch Clusters ❤️  ##     🔗 Total 4 CLUSTERS
##          (DEV/UAT)           ## 
##################################
# OpenSearch DEV/UAT Clusters(4)
variable "r360_edms_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "R360/EDMS-Dev1-Pri-OpenSearch"
    Entity_Name  = "dsdpdlked1e1a03"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXw4NzM0MzExOTU3Njk3Nzk0NDE4"
  }
}
variable "r360_edms_U1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "R360/EDMS-UAT1-Pri-OpenSearch"
    Entity_Name  = "dsdpdlkeu1e1a01"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtNDkxMDU2OTQzNjIwMTI1ODgwNQ"
  }
}
variable "auditLog_edms_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "AuditLog-EDMS-Dev1-OpenSearch"
    Entity_Name  = "opsr-ssdpe1-mdt-d1-audit-log"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXw0MzYwMTg0MDU1Mjc1NTI0MTk"
  }
}
variable "auditLog1_dp_D1_Pri" {
  type = object({
    Entity_Name  = string
    Cluster_Name = string
    Entity_GUID  = string
  })
  default = {
    Cluster_Name = "AuditLog1-DP-Dev1-OpenSearch"
    Entity_Name  = "opsr-ssdpe1-dp-d1-adt-log-01"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwtOTEyNzE0MTQzMTc5ODAyMDg4Nw"
  }
}





################################
##        👈(●‿●)👉         ##
##     💞 EC2 Instance 💞    ##     💻 Total 27 INSTANCES
##     (DEV/UAT/STAGE/PROD)   ## 
################################
# ❤️ MDM-APP-Server (Dev) [5]
variable "ec2_mdm_app_dev" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Dev"
    Entity_Name  = "ssdpemdmd1e1a01.mdcloud.local"
    Entity_GUID  = "MjQ2OTczNHxJTkZSQXxOQXwzMDU1NzQ0MTE5MjY5MzA0MDEy"
  }
}
variable "ec2_mdm_app_dev_enhans" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Dev-EnHans"
    Entity_Name   = "ssdpemdmd2e1a01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXwtNjQxNjQ4Nzg0NDMxNDI5ODE4Mg"
  }
}
variable "ec2_mdm_app_uat_node1" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-UAT-Node-1"
    Entity_Name   = "ssdpemdmu1e1a04.mdcloud.local"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXwtNjQ2NzI0NDQ5NDYyMzk3OTkwOQ"
  }
}
variable "ec2_mdm_app_uat_node2" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-UAT-Node-2"
    Entity_Name   = "ssdpemdmu1e1c03.mdcloud.local"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXwtMTY3NjIyNDk0MDUxNTU2MTM3OQ"
  }
}
variable "ec2_mdm_app_uat_enhans" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-UAT-EnHans"
    Entity_Name   = "ssdpemdmu2e1a01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw0MTM2NzY4NzQxMTU1Mzg0NDUx"
  }
}
# 💕 MDM-APP-Server (Prod) [5]
variable "ec2_mdm_app_stage_node1" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Stage-Node-1"
    Entity_Name   = "sdppemdms1e1a01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXw1MDQ5MTIzMzExNTAyNDExMzg0"
  }
}
variable "ec2_mdm_app_stage_node2" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Stage-Node-2"
    Entity_Name   = "sdppemdms1e1c01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXwtMjYwMjM1NDU5MDE0NzgxMDI5OA"
  }
}
variable "ec2_mdm_app_stage_enhans" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Stage-EnHans"
    Entity_Name   = "sdppemdms2e1a01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXwtNTEzNTA0NzU2NzU5MDE1ODc1NA"
  }
}
variable "ec2_mdm_app_prod_node1" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Prod-Node-1"
    Entity_Name   = "sdppemdmp1e1a01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXwzMjA1OTY4Mjk2MjEwMjk1NDc"
  }
}
variable "ec2_mdm_app_prod_node2" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-APP-Prod-Node-2"
    Entity_Name   = "sdppemdmp1e1c01.mdcloud.local"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXwtMzgzMjIzMzk2MzAxMDQ3NTQ4Mg"
  }
}
# ❤️ SQL Server "NEW" (Dev) [4]
variable "ec2_sdp_sql_dev" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-Dev" 
    Entity_Name   = "SSDPMSQLD1E1A03"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw2ODY0NTIyOTM0OTAyNTI3NDUw"
  }
}
variable "ec2_sdp_sql_dev_enhans" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-Dev-EnHans" 
    Entity_Name   = "SSDPMSQLD1E1A04"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw4Mjk0NzI2Mzc4MjExNzE2OTc3"
  }
}
variable "ec2_sdp_sql_uat_pri" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-UAT-Pri" 
    Entity_Name   = "SSDPMSQLUTE1C01"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXwtNTI0MTY5Mzk5NDUyNDM0MzY4Ng"
  }
}
variable "ec2_sdp_sql_uat_sec" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-UAT-Sec" 
    Entity_Name   = "SSDPMSQLUTE1A01"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw4ODEzNzUwODIwNzkwODM4NDIy"
  }
}
# 💕 SQL Server "NEW" (Prod) [5]
variable "ec2_sdp_sql_stage_pri" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-Stage-Pri" 
    Entity_Name   = "SSDPMSQLS1E1C02"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXwtMzEyNjMxNjA5MzgwNTI5NzI5MA"
  }
}
variable "ec2_sdp_sql_stage_sec" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-Stage-Sec" 
    Entity_Name   = "SSDPMSQLS1E1A02"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw0MTcwMTE5MDQyOTczNDkyNDMx"
  }
}
variable "ec2_sdp_sql_prod_pri" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-Prod-Pri" 
    Entity_Name   = "SSDPMSQLPRE1A01"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXw2OTg1NzkzNjc4Njg5MzA3NDk0"
  }
}
variable "ec2_sdp_sql_prod_sec" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-Prod-Sec" 
    Entity_Name   = "SSDPMSQLPRE1C01"
    Entity_GUID   = "MjQ2OTczN3xJTkZSQXxOQXwtNjU3ODU5NjA0NDQ3NzQ1MTU5Mw"
  }
}
variable "ec2_sdp_sql_uat_enhans" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "SDP-SQL-UAT-EnHans" 
    Entity_Name   = "SSDPMSQLUTE1A03"
    Entity_GUID   = "MjQ2OTczMnxJTkZSQXxOQXwzNjA3NTQ0ODg1NjcwNTI4MjM2"
  }
}
# SQL Server "OLD" (Dev/Prod) [8]
variable "ec2_mdm_sql_sanbox1" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-SanBox-1" 
    Entity_Name   = "MDTDEV2SQLE1C01"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw2MjE0MTcxMzIyMjQzMzQ0MTky"
  }
}
variable "ec2_mdm_sql_sanbox2" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-SanBox-2" 
    Entity_Name   = "MDMMSQLT1E1C02"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw0NzM1MDUzMjg5MzMwMzQwOTQ1"
  }
}
variable "ec2_mdm_sql_uat_sec1" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-UAT-Sec-1" 
    Entity_Name   = "DMDMMSQLUTE1A01"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw5MDk2MDMyMjAyMTAwMzU0NjM1"
  }
}
variable "ec2_mdm_sql_uat_sec2" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-UAT-Sec-2" 
    Entity_Name   = "DMDMMSQLUTE1C02"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw1MjUyNDYzODUzMzI2MjA1NTg5"
  }
}
variable "ec2_mdm_sql_stage_pri" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-Stage-Pri"
    Entity_Name   = "DMDMMSQLUTE1C02"
    Entity_GUID   = "MjQ2OTczNHxJTkZSQXxOQXw1MjUyNDYzODUzMzI2MjA1NTg5"
  }
}
variable "ec2_mdm_sql_stage_sec" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-Stage-Sec"
    Entity_Name   = "MDTSTAGSQLE1C01"
    Entity_GUID   = "MjQ2OTY5NXxJTkZSQXxOQXw2NjM1NTc5ODg3NDEzMzYwMTkx"
  }
}
variable "ec2_mdm_sql_prod_pri" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-Prod-Pri"
    Entity_Name   = "MDTSTAGSQLE1D01"
    Entity_GUID   = "MjQ2OTY5NXxJTkZSQXxOQXw2MDE3MTczMDAwMTc0OTgxOTYw"
  }
}
variable "ec2_mdm_sql_prod_sec" {
  type = object({
    Entity_Name  = string
    Instance_Name = string
    Entity_GUID  = string
  })
  default = {
    Instance_Name = "MDM-SQL-Prod-Sec"
    Entity_Name   = "SPRDMSQLPRE1C01"
    Entity_GUID   = "MjQ2OTczMnxJTkZSQXxOQXw0NjYxMjc5ODYyMjAzMjk1NTYw"
  }
}
## ❤️💕💞 
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      # version = "~> 2.47.0"
      version = ">= 3.0.0"
    }
  }
}

provider "newrelic" {
  api_key = "XXX-YYY-ZZZ"
  account_id = var.acc_id_mdt_sdp
}



################################
##    Document Dashboard      ##
##       (Dev/uat) Env        ##
################################  
# NewRelic Dashboard for the DocumentDB
# -->Cluster-CPU   -->Active-Connections    -->Write-IOPS   -->Read-IOPS
resource "newrelic_one_dashboard" "documentdb_dashboard" {
  name        = "T-DocumentDB-Dashboard"
  description = "Document-DB Dashboard utilization metrics"
  permissions = "public_read_write"
  page {
    name = "DocumentDB Metrics Overview"

  # CPU Cluster Utilization Widget
    widget_line {
      title        = "Clusters CPU Status ${var.suffix_dev}"
      row          = 1
      column       = 1
      width        = 6
      height       = 4
      nrql_query {
        query = <<-NRQL
          SELECT sum(`provider.cpuUtilization.Sum`)
          FROM AwsDocDbClusterSample 
          WHERE provider='AwsDocDbCluster' 
          FACET CASES(
            WHERE entityName = '${var.EDMS_U1_Pri.Entity_Name}' AS '${var.EDMS_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Pri.Entity_Name}' AS '${var.EDMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Pri.Entity_Name}' AS '${var.EDMS_D2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Pri.Entity_Name}' AS '${var.EDMS_D3_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U2_Pri.Entity_Name}' AS '${var.EDMS_U2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Sec.Entity_Name}' AS '${var.EDMS_D1_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Sec.Entity_Name}' AS '${var.EDMS_D3_Sec.Cluster_Name}',
            WHERE entityName = '${var.CJAMS_D1_Pri.Entity_Name}' AS '${var.CJAMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Sec.Entity_Name}' AS '${var.EDMS_D2_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U1_Sec.Entity_Name}' AS '${var.EDMS_U1_Sec.Cluster_Name}',
            WHERE entityName = '${var.R360_U1_Pri.Entity_Name}' AS '${var.R360_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.R360_D1_Pri.Entity_Name}' AS '${var.R360_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.DP_D1_Pri.Entity_Name}' AS '${var.DP_D1_Pri.Cluster_Name}'
          ) 
          TIMESERIES auto
        NRQL
      }
      # legend_enabled = true
      ignore_time_range = false
      # y_axis_left_zero = true
    }
  # DocumentDB Active Connections Widget
    widget_billboard {
      title        = "Cluster Connection Counts ${var.suffix_dev}"
      row          = 1
      column       = 7
      width        = 6
      height       = 4
      nrql_query {
        query = <<-NRQL
          SELECT latest(`provider.databaseConnections.Maximum`) AS `CurrentConnections`
          FROM AwsDocDbClusterSample 
          WHERE provider='AwsDocDbCluster' 
          FACET CASES(
            WHERE entityName = '${var.EDMS_U1_Pri.Entity_Name}' AS '${var.EDMS_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Pri.Entity_Name}' AS '${var.EDMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Pri.Entity_Name}' AS '${var.EDMS_D2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Pri.Entity_Name}' AS '${var.EDMS_D3_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U2_Pri.Entity_Name}' AS '${var.EDMS_U2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Sec.Entity_Name}' AS '${var.EDMS_D1_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Sec.Entity_Name}' AS '${var.EDMS_D3_Sec.Cluster_Name}',
            WHERE entityName = '${var.CJAMS_D1_Pri.Entity_Name}' AS '${var.CJAMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Sec.Entity_Name}' AS '${var.EDMS_D2_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U1_Sec.Entity_Name}' AS '${var.EDMS_U1_Sec.Cluster_Name}',
            WHERE entityName = '${var.R360_U1_Pri.Entity_Name}' AS '${var.R360_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.R360_D1_Pri.Entity_Name}' AS '${var.R360_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.DP_D1_Pri.Entity_Name}' AS '${var.DP_D1_Pri.Cluster_Name}'
          ) 
        NRQL
      }
      ignore_time_range = false
    }
  # DocumentDB Write IOPS Widget
    widget_line {
      title        = "Cluster Write IOPS ${var.suffix_dev}"
      row          = 5
      column       = 1
      width        = 6
      height       = 4
      nrql_query {
        query = <<-NRQL
          SELECT sum(newrelic.goldenmetrics.infra.awsdocdbcluster.writeIops) AS 'Write IOPS'
          FROM Metric 
          WHERE entityName IN ('${var.EDMS_U1_Pri.Entity_Name}', '${var.EDMS_D1_Pri.Entity_Name}', '${var.EDMS_D2_Pri.Entity_Name}', '${var.EDMS_D3_Pri.Entity_Name}', '${var.EDMS_U2_Pri.Entity_Name}', '${var.EDMS_D1_Sec.Entity_Name}', '${var.EDMS_D3_Sec.Entity_Name}', '${var.CJAMS_D1_Pri.Entity_Name}', '${var.EDMS_D2_Sec.Entity_Name}', '${var.EDMS_U1_Sec.Entity_Name}', '${var.R360_U1_Pri.Entity_Name}', '${var.R360_D1_Pri.Entity_Name}', '${var.DP_D1_Pri.Entity_Name}')
          FACET CASES(
            WHERE entityName = '${var.EDMS_U1_Pri.Entity_Name}' AS '${var.EDMS_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Pri.Entity_Name}' AS '${var.EDMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Pri.Entity_Name}' AS '${var.EDMS_D2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Pri.Entity_Name}' AS '${var.EDMS_D3_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U2_Pri.Entity_Name}' AS '${var.EDMS_U2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Sec.Entity_Name}' AS '${var.EDMS_D1_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Sec.Entity_Name}' AS '${var.EDMS_D3_Sec.Cluster_Name}',
            WHERE entityName = '${var.CJAMS_D1_Pri.Entity_Name}' AS '${var.CJAMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Sec.Entity_Name}' AS '${var.EDMS_D2_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U1_Sec.Entity_Name}' AS '${var.EDMS_U1_Sec.Cluster_Name}',
            WHERE entityName = '${var.R360_U1_Pri.Entity_Name}' AS '${var.R360_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.R360_D1_Pri.Entity_Name}' AS '${var.R360_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.DP_D1_Pri.Entity_Name}' AS '${var.DP_D1_Pri.Cluster_Name}'
          ) 
          TIMESERIES auto
        NRQL
      }

      ignore_time_range = false
    }
  # DocumentDB Read IOPS Widget
    widget_line {
      title        = "Cluster Read IOPS ${var.suffix_dev}"
      row          = 5
      column       = 7
      width        = 6
      height       = 4
      nrql_query {
        query = <<-NRQL
          SELECT sum(newrelic.goldenmetrics.infra.awsdocdbcluster.readIopos) AS 'Read IOPS'
          FROM Metric 
          WHERE entityName IN ('${var.EDMS_U1_Pri.Entity_Name}', '${var.EDMS_D1_Pri.Entity_Name}', '${var.EDMS_D2_Pri.Entity_Name}', '${var.EDMS_D3_Pri.Entity_Name}', '${var.EDMS_U2_Pri.Entity_Name}', '${var.EDMS_D1_Sec.Entity_Name}', '${var.EDMS_D3_Sec.Entity_Name}', '${var.CJAMS_D1_Pri.Entity_Name}', '${var.EDMS_D2_Sec.Entity_Name}', '${var.EDMS_U1_Sec.Entity_Name}', '${var.R360_U1_Pri.Entity_Name}', '${var.R360_D1_Pri.Entity_Name}', '${var.DP_D1_Pri.Entity_Name}')
          FACET CASES(
            WHERE entityName = '${var.EDMS_U1_Pri.Entity_Name}' AS '${var.EDMS_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Pri.Entity_Name}' AS '${var.EDMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Pri.Entity_Name}' AS '${var.EDMS_D2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Pri.Entity_Name}' AS '${var.EDMS_D3_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U2_Pri.Entity_Name}' AS '${var.EDMS_U2_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D1_Sec.Entity_Name}' AS '${var.EDMS_D1_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D3_Sec.Entity_Name}' AS '${var.EDMS_D3_Sec.Cluster_Name}',
            WHERE entityName = '${var.CJAMS_D1_Pri.Entity_Name}' AS '${var.CJAMS_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.EDMS_D2_Sec.Entity_Name}' AS '${var.EDMS_D2_Sec.Cluster_Name}',
            WHERE entityName = '${var.EDMS_U1_Sec.Entity_Name}' AS '${var.EDMS_U1_Sec.Cluster_Name}',
            WHERE entityName = '${var.R360_U1_Pri.Entity_Name}' AS '${var.R360_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.R360_D1_Pri.Entity_Name}' AS '${var.R360_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.DP_D1_Pri.Entity_Name}' AS '${var.DP_D1_Pri.Cluster_Name}'
          ) 
          TIMESERIES auto
        NRQL
      }
      ignore_time_range = false
    }
  }
}





################################
##    OpenSearch Dashboard    ##
##       (Dev/uat) Env        ##
################################  
# NewRelic Dashboard for the OpenSearch
resource "newrelic_one_dashboard" "opensearch_dashboard" {
  name        = "T-OpenSearch-Dashboard"
  description = "OpenSearch Cluster Dashboard"
  permissions = "public_read_write"
  
  page {
    name = "OpenSearch Cluster Overview"

    # Cluster Status Widget Count
    widget_table {
      title        = "Cluster Status ${var.suffix_dev}"
      row          = 1
      column       = 1
      width        = 6
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            max(`provider.ClusterStatus.green.Maximum`) as GreenStatus, 
            max(`provider.ClusterStatus.yellow.Maximum`) as YellowStatus, 
            max(`provider.ClusterStatus.red.Maximum`) as RedStatus,
            average(`provider.Nodes.Average`) AS Nodes
          FROM DatastoreSample 
          WHERE provider='ElasticsearchCluster'
          FACET CASES(
            WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
            WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}',
            WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}'
          )
          //TIMESERIES auto
        NRQL
      }
      ignore_time_range = false
    }
    # Cluster CPU Status Widget
    widget_line {
      title        = "Cluster CPU Utilization ${var.suffix_dev}"
      row          = 1
      column       = 7
      width        = 6
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            average(`provider.CPUUtilization.Maximum`) AS `CPU utilization (%)`
          FROM 
            DatastoreSample 
          WHERE 
            provider = 'ElasticsearchCluster' 
          FACET 
            CASES(
              WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}'
            )
          TIMESERIES AUTO
        NRQL
      }
      ignore_time_range = false
    }
    # JVM Memory Pressure Widget
    widget_line {
      title        = "JVM Memory Pressure ${var.suffix_dev}"
      row          = 4
      column       = 1
      width        = 6
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            average(`provider.JVMMemoryPressure.Maximum`) AS `JVM Memory Pressure (%)`
          FROM 
            DatastoreSample 
          WHERE 
            provider = 'ElasticsearchCluster' 
          FACET 
            CASES(
              WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}'
            )
          TIMESERIES AUTO
        NRQL
      }
      ignore_time_range = false
    }
    # System Memory Utilization Widget
    widget_line {
      title        = "Cluster Memory Utilization ${var.suffix_dev}"
      row          = 4
      column       = 7
      width        = 6
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            average(`provider.SysMemoryUtilization.Maximum`) AS `Memory utilization (%)`
          FROM 
            DatastoreSample 
          WHERE 
            provider = 'ElasticsearchCluster' 
          FACET 
            CASES(
              WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}'
            )
          TIMESERIES AUTO
        NRQL
      }
      ignore_time_range = false
    }
    # 2xx Responses Widget (Line)
    widget_line {
      title        = "2xx Responses ${var.suffix_dev}"
      row          = 7
      column       = 1
      width        = 4
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            sum(`provider.2xx.Sum`) AS `2xx Responses`
          FROM 
            DatastoreSample 
          WHERE 
            provider = 'ElasticsearchCluster'
          FACET 
            CASES(
              WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}'
            )
          TIMESERIES AUTO
        NRQL
      }
      ignore_time_range = false
    }
    # 4xx Responses Widget (Line)
    widget_line {
      title        = "4xx Responses ${var.suffix_dev}"
      row          = 7
      column       = 5
      width        = 4
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            sum(`provider.4xx.Sum`) AS `4xx Responses`
          FROM 
            DatastoreSample 
          WHERE 
            provider = 'ElasticsearchCluster'
          FACET 
            CASES(
              WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}'
            )
          TIMESERIES AUTO
        NRQL
      }
      ignore_time_range = false
    }
    # 5xx Responses Widget (Line)
    widget_line {
      title        = "5xx Responses ${var.suffix_dev}"
      row          = 7
      column       = 9
      width        = 4
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            sum(`provider.5xx.Sum`) AS `5xx Responses`
          FROM 
            DatastoreSample 
          WHERE 
            provider = 'ElasticsearchCluster'
          FACET 
            CASES(
              WHERE entityName = '${var.r360_edms_D1_Pri.Entity_Name}' AS '${var.r360_edms_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.r360_edms_U1_Pri.Entity_Name}' AS '${var.r360_edms_U1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog1_dp_D1_Pri.Entity_Name}' AS '${var.auditLog1_dp_D1_Pri.Cluster_Name}',
              WHERE entityName = '${var.auditLog_edms_D1_Pri.Entity_Name}' AS '${var.auditLog_edms_D1_Pri.Cluster_Name}'
            )
          TIMESERIES AUTO
        NRQL
      }
      ignore_time_range = false
    }
  }
}

################################
##        👈(●‿●)👉         ##
##     💞 EC2 Dashboard 💞   ##
##     (DEV/UAT/STAGE/PROD)   ## 
################################
resource "newrelic_one_dashboard" "ec2_dashboard" {
  name        = "T-EC2-Performance-Strips"
  description = "EC2 Instances Dashboard"
  permissions = "public_read_write"
  
  page {
    name = "EC2 Instances Overview"

  # ❤️ EC2 CPU Status Widget "Dev"
    widget_line {
      title        = "EC2 CPU Utilization ${var.suffix_dev}"
      row          = 1
      column       = 1
      width        = 6
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            average(`cpuPercent`) AS `CPU used %`
          FROM 
            SystemSample 
          WHERE 
            provider = 'Ec2Instance' 
          FACET 
            CASES(
              // MDM Dev Servers (6)
              WHERE entityName = '${var.ec2_mdm_app_dev.Entity_Name}' AS '${var.ec2_mdm_app_dev.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_dev_enhans.Entity_Name}' AS '${var.ec2_mdm_app_dev_enhans.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_uat_node1.Entity_Name}' AS '${var.ec2_mdm_app_uat_node1.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_uat_node2.Entity_Name}' AS '${var.ec2_mdm_app_uat_node2.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_uat_enhans.Entity_Name}' AS '${var.ec2_mdm_app_uat_enhans.Instance_Name}',
              // SQL Dev Server (4)
              WHERE entityName = '${var.ec2_sdp_sql_dev.Entity_Name}' AS '${var.ec2_sdp_sql_dev.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_dev_enhans.Entity_Name}' AS '${var.ec2_sdp_sql_dev_enhans.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_uat_pri.Entity_Name}' AS '${var.ec2_sdp_sql_uat_pri.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_uat_sec.Entity_Name}' AS '${var.ec2_sdp_sql_uat_sec.Instance_Name}'
            )
          TIMESERIES AUTO
        NRQL
        account_id = var.acc_id_mdt_sdp
      }
      ignore_time_range = false
    }
  # 💕 EC2 CPU Status Widget "Prod"
    widget_line {
      title        = "EC2 CPU Utilization ${var.suffix_prod}"
      row          = 1
      column       = 7
      width        = 6
      height       = 3
      nrql_query {
        query = <<-NRQL
          SELECT 
            average(`cpuPercent`) AS `CPU used %`
          FROM 
            SystemSample 
          WHERE 
            provider = 'Ec2Instance' 
          FACET 
            CASES(
              // MDM Prod Servers (5)
              WHERE entityName = '${var.ec2_mdm_app_stage_node1.Entity_Name}' AS '${var.ec2_mdm_app_stage_node1.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_stage_node2.Entity_Name}' AS '${var.ec2_mdm_app_stage_node2.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_stage_enhans.Entity_Name}' AS '${var.ec2_mdm_app_stage_enhans.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_prod_node1.Entity_Name}' AS '${var.ec2_mdm_app_prod_node1.Instance_Name}',
              WHERE entityName = '${var.ec2_mdm_app_prod_node2.Entity_Name}' AS '${var.ec2_mdm_app_prod_node2.Instance_Name}',
              // SQL Prod Servers (5)
              WHERE entityName = '${var.ec2_sdp_sql_stage_pri.Entity_Name}' AS '${var.ec2_sdp_sql_stage_pri.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_stage_sec.Entity_Name}' AS '${var.ec2_sdp_sql_stage_sec.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_prod_pri.Entity_Name}' AS '${var.ec2_sdp_sql_prod_pri.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_prod_sec.Entity_Name}' AS '${var.ec2_sdp_sql_prod_sec.Instance_Name}',
              WHERE entityName = '${var.ec2_sdp_sql_uat_enhans.Entity_Name}' AS '${var.ec2_sdp_sql_uat_enhans.Instance_Name}'
            )
          TIMESERIES AUTO
        NRQL
        account_id = var.acc_id_mdt_sdp_prod
      }
      ignore_time_range = false
    }
  }
}





##################################
##    💞   👈(●‿●)👉   💞    ##
##          EC2 Alerts          ##
##    (Contition & Policy)      ##
##################################
# 💞 EC2 Alert Policy
resource "newrelic_alert_policy" "ec2_alert_policy" {
  name = "EC2-Alert-Policy"
}
# 📧 Email Destination "Email-ID"
resource "newrelic_notification_destination" "email_destination" {
  account_id = var.acc_id_mdt_sdp
  name = "Nandanargunan"
  type = "EMAIL"
  property {
    key = "email"
    value = "nandanargunan.lakshmanan@maryland.gov"
  }
}
# 📩 Email Channel for customize Subjet line
resource "newrelic_notification_channel" "email_channel" {
  account_id = var.acc_id_mdt_sdp
  name = "Channel-Notify"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.email_destination.id
  product = "IINT"
  property {
    key = "subject"
    value = trimspace(<<-EOT
    {{ issueTitle }} - Issue {{issueId}} - Timestamp: {{ timestamp }} Instance: ${var.ec2_mdm_app_dev.Instance_Name}
    EOT
    )
  }
  # property {
  #   key   = "body"
  #   value = trimspace(<<-EOT
  #     Alert Details:
  #     Issue: {{ issueTitle }}
  #     Issue ID: {{ issueId }}
  #     Server: {{ serverName }}
  #     Severity: {{ severity }}
  #     Condition: {{ conditionName }}
  #     Timestamp: {{ timestamp }}
      
  #     Please check the issue at: {{ permalink }}
  #   EOT
  #   )
  # }
}
# WorkFlow
resource "newrelic_workflow" "workflow" {
  account_id = var.acc_id_mdt_sdp
  name = "Email-WorkFlow"
  enabled = true
  muting_rules_handling = "DONT_NOTIFY_FULLY_MUTED_ISSUES"
  issues_filter {
    name = "workflow_filter"
    type = "FILTER"
    
    predicate {
      attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"
      values = [newrelic_alert_policy.ec2_alert_policy.id]
    }
    # predicate {
    #   attribute = "priority"
    #   operator = "EQUAL"
    #   values = ["CRITICAL"]
    # }
  }

  destination {
    channel_id = newrelic_notification_channel.email_channel.id
    notification_triggers = ["ACTIVATED", "ACKNOWLEDGED", "CLOSED"]
    update_original_message = true
  }
}
# ❤️ EC2 "Dev" Alert Contition "CPU Utilz"
resource "newrelic_nrql_alert_condition" "ec2_cpu_dev_utilz_condition" {
  policy_id = newrelic_alert_policy.ec2_alert_policy.id
  name      = "EC2-CPU-Metrix ${var.suffix_dev}"
  nrql {
    query = <<-NRQL
      SELECT 
        average(cpuPercent) 
      FROM 
        SystemSample 
      WHERE 
        provider = 'Ec2Instance' 
      FACET 
        CASES(
          // MDM Dev Servers (6)
          WHERE entityName = '${var.ec2_mdm_app_dev.Entity_Name}' AS '${var.ec2_mdm_app_dev.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_dev_enhans.Entity_Name}' AS '${var.ec2_mdm_app_dev_enhans.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_uat_node1.Entity_Name}' AS '${var.ec2_mdm_app_uat_node1.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_uat_node2.Entity_Name}' AS '${var.ec2_mdm_app_uat_node2.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_uat_enhans.Entity_Name}' AS '${var.ec2_mdm_app_uat_enhans.Instance_Name}',
          // SQL Dev Server (4)
          WHERE entityName = '${var.ec2_sdp_sql_dev.Entity_Name}' AS '${var.ec2_sdp_sql_dev.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_dev_enhans.Entity_Name}' AS '${var.ec2_sdp_sql_dev_enhans.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_uat_pri.Entity_Name}' AS '${var.ec2_sdp_sql_uat_pri.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_uat_sec.Entity_Name}' AS '${var.ec2_sdp_sql_uat_sec.Instance_Name}'
        )
    NRQL
    # since_value = "3"   # Monitoring last 3 minutes
  }
  critical {
    operator               = "above"
    threshold              = 80        # Trigger alert when CPU usage is above 80%
    threshold_duration     = 300       # Mentioned in Seconds
    threshold_occurrences  = "ALL"
  }
  warning {
    operator               = "above"
    threshold              = 70        # Trigger warning when CPU usage is above 70%
    threshold_duration     = 300       # Mentioned in Seconds
    threshold_occurrences  = "ALL"
  }
  violation_time_limit_seconds = 259200  # mentioned in seconds, for 3 days
}
# 💕 EC2 "Prod" Alert Contition "CPU Utilz"
resource "newrelic_nrql_alert_condition" "ec2_cpu_prod_utilz_condition" {
  policy_id = newrelic_alert_policy.ec2_alert_policy.id
  name      = "EC2-CPU-Metrix ${var.suffix_prod}"
  nrql {
    query = <<-NRQL
      SELECT 
        average(cpuPercent) 
      FROM 
        SystemSample 
      WHERE 
        provider = 'Ec2Instance' 
      FACET 
        CASES(
          // MDM Prod Servers (5)
          WHERE entityName = '${var.ec2_mdm_app_stage_node1.Entity_Name}' AS '${var.ec2_mdm_app_stage_node1.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_stage_node2.Entity_Name}' AS '${var.ec2_mdm_app_stage_node2.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_stage_enhans.Entity_Name}' AS '${var.ec2_mdm_app_stage_enhans.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_prod_node1.Entity_Name}' AS '${var.ec2_mdm_app_prod_node1.Instance_Name}',
          WHERE entityName = '${var.ec2_mdm_app_prod_node2.Entity_Name}' AS '${var.ec2_mdm_app_prod_node2.Instance_Name}',
          // SQL Prod Servers (5)
          WHERE entityName = '${var.ec2_sdp_sql_stage_pri.Entity_Name}' AS '${var.ec2_sdp_sql_stage_pri.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_stage_sec.Entity_Name}' AS '${var.ec2_sdp_sql_stage_sec.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_prod_pri.Entity_Name}' AS '${var.ec2_sdp_sql_prod_pri.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_prod_sec.Entity_Name}' AS '${var.ec2_sdp_sql_prod_sec.Instance_Name}',
          WHERE entityName = '${var.ec2_sdp_sql_uat_enhans.Entity_Name}' AS '${var.ec2_sdp_sql_uat_enhans.Instance_Name}'
        )
    NRQL
    # since_value = "3"   # Monitoring last 3 minutes
  }
  critical {
    operator               = "above"
    threshold              = 80        # Trigger alert when CPU usage is above 80%
    threshold_duration     = 300       # Mentioned in Seconds
    threshold_occurrences  = "ALL"
  }
  warning {
    operator               = "above"
    threshold              = 70        # Trigger warning when CPU usage is above 70%
    threshold_duration     = 300       # Mentioned in Seconds
    threshold_occurrences  = "ALL"
  }
  violation_time_limit_seconds = 259200  # mentioned in seconds, for 3 days
}






##############################
##  ❤️   👈(●‿●)👉   ❤️  ##
##    Non-Prod Workload     ##
##      (Dev/uat) Env       ##
##############################
resource "newrelic_workload" "nonprod_workload" {
  name = "Non-Prod-Env"
  account_id = var.acc_id_mdt_sdp
  entity_guids = [
    # DocumentDB (NonProd)
    var.EDMS_D3_Sec.Entity_GUID,
    var.EDMS_U1_Pri.Entity_GUID,
    var.EDMS_D1_Pri.Entity_GUID,
    var.EDMS_D2_Pri.Entity_GUID,
    var.EDMS_D3_Pri.Entity_GUID,
    var.EDMS_U2_Pri.Entity_GUID,
    var.EDMS_D1_Sec.Entity_GUID,
    var.CJAMS_D1_Pri.Entity_GUID,
    var.EDMS_D2_Sec.Entity_GUID,
    var.EDMS_U1_Sec.Entity_GUID,
    var.R360_U1_Pri.Entity_GUID,
    var.R360_D1_Pri.Entity_GUID,
    var.DP_D1_Pri.Entity_GUID,
    
    # OpenSearch (NonProd)
    var.r360_edms_D1_Pri.Entity_GUID,
    var.r360_edms_U1_Pri.Entity_GUID,
    var.auditLog_edms_D1_Pri.Entity_GUID,
    var.auditLog1_dp_D1_Pri.Entity_GUID,
    
    # MDM-APP-Server (NonProd)
    var.ec2_mdm_app_dev.Entity_GUID,
    var.ec2_mdm_app_dev_enhans.Entity_GUID,
    var.ec2_mdm_app_uat_node1.Entity_GUID,
    var.ec2_mdm_app_uat_node2.Entity_GUID,
    var.ec2_mdm_app_uat_enhans.Entity_GUID,
  ]
}







################################
##        👈(●‿●)👉         ##
##     💞 TAG Names 💞       ##
##     (DEV/UAT/STAGE/PROD)   ## 
################################
# ❤️ Tag Assign For Document-DB "CLUSTER's" -- DEV/UAT
resource "newrelic_entity_tags" "EDMS_D3_Sec_tag" {
  guid = var.EDMS_D3_Sec.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_D3_Sec.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_U1_Pri_tag" {
  guid = var.EDMS_U1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_U1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_D1_Pri_tag" {
  guid = var.EDMS_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_D2_Pri_tag" {
  guid = var.EDMS_D2_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_D2_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_D3_Pri_tag" {
  guid = var.EDMS_D3_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_D3_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_U2_Pri_tag" {
  guid = var.EDMS_U2_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_U2_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_D1_Sec_tag" {
  guid = var.EDMS_D1_Sec.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_D1_Sec.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "CJAMS_D1_Pri_tag" {
  guid = var.CJAMS_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.CJAMS_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_cjams[0]
    values = [var.tag_app_cjams[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_D2_Sec_tag" {
  guid = var.EDMS_D2_Sec.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_D2_Sec.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "EDMS_U1_Sec_tag" {
  guid = var.EDMS_U1_Sec.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.EDMS_U1_Sec.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "R360_U1_Pri_tag" {
  guid = var.R360_U1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.R360_U1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_r360[0]
    values = [var.tag_app_r360[1]]
  }
}
resource "newrelic_entity_tags" "R360_D1_Pri_tag" {
  guid = var.R360_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.R360_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_r360[0]
    values = [var.tag_app_r360[1]]
  }
}
resource "newrelic_entity_tags" "DP_D1_Pri_tag" {
  guid = var.DP_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_ddb_dev[0]
    values = [var.tag_service_ddb_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.DP_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_dp[0]
    values = [var.tag_app_dp[1]]
  }
}

# ❤️ Tag Assign For OpenSearch "CLUSTER's" -- DEV/UAT
resource "newrelic_entity_tags" "r360_edms_D1_Pri_estag" {
  guid = var.r360_edms_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_es_dev[0]
    values = [var.tag_service_es_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.r360_edms_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_r360[0]
    values = [var.tag_app_r360[1]]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "r360_edms_U1_Pri_estag" {
  guid = var.r360_edms_U1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_es_dev[0]
    values = [var.tag_service_es_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.r360_edms_U1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_r360[0]
    values = [var.tag_app_r360[1]]
  }
  # Application Name
  tag {
    key    = var.tag_app_edms[0]
    values = [var.tag_app_edms[1]]
  }
}
resource "newrelic_entity_tags" "auditLog_edms_D1_Pri_estag" {
  guid = var.auditLog_edms_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_es_dev[0]
    values = [var.tag_service_es_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.auditLog_edms_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = "Application"
    values = ["AuditLogs"]
  }
}
resource "newrelic_entity_tags" "auditLog1_dp_D1_Pri_estag" {
  guid = var.auditLog1_dp_D1_Pri.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # Service Name
  tag {
    key    = var.tag_service_es_dev[0]
    values = [var.tag_service_es_dev[1]]
  }
  # Cluster Name
  tag {
    key    = var.tag_DocDB_ClusterName_dev[0]
    values = [var.auditLog1_dp_D1_Pri.Cluster_Name]
  }
  # Application Name
  tag {
    key    = "Application"
    values = ["AuditLogs-1"]
  }
}

# ❤️ Tag Assign For Infomatica MDM "EC2-Instances" -- DEV/UAT
resource "newrelic_entity_tags" "ec2_mdm_app_dev_ec2tag" {
  guid = var.ec2_mdm_app_dev.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # EC2-Instance Name
  tag {
    key    = var.tag_ec2_name[0]
    values = [var.ec2_mdm_app_dev.Instance_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_mdm[0]
    values = [var.tag_app_mdm[1]]
  }
}
resource "newrelic_entity_tags" "ec2_mdm_app_dev_enhans_ec2tag" {
  guid = var.ec2_mdm_app_dev_enhans.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # EC2-Instance Name
  tag {
    key    = var.tag_ec2_name[0]
    values = [var.ec2_mdm_app_dev_enhans.Instance_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_mdm[0]
    values = [var.tag_app_mdm[1]]
  }
}
resource "newrelic_entity_tags" "ec2_mdm_app_uat_node1_ec2tag" {
  guid = var.ec2_mdm_app_uat_node1.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # EC2-Instance Name
  tag {
    key    = var.tag_ec2_name[0]
    values = [var.ec2_mdm_app_uat_node1.Instance_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_mdm[0]
    values = [var.tag_app_mdm[1]]
  }
}
resource "newrelic_entity_tags" "ec2_mdm_app_uat_node2_ec2tag" {
  guid = var.ec2_mdm_app_uat_node2.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # EC2-Instance Name
  tag {
    key    = var.tag_ec2_name[0]
    values = [var.ec2_mdm_app_uat_node2.Instance_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_mdm[0]
    values = [var.tag_app_mdm[1]]
  }
}
resource "newrelic_entity_tags" "ec2_mdm_app_uat_enhans_ec2tag" {
  guid = var.ec2_mdm_app_uat_enhans.Entity_GUID
  # Environment
  tag {
    key    = var.tag_env_dev[0]
    values = [var.tag_env_dev[1]]
  }
  # EC2-Instance Name
  tag {
    key    = var.tag_ec2_name[0]
    values = [var.ec2_mdm_app_uat_enhans.Instance_Name]
  }
  # Application Name
  tag {
    key    = var.tag_app_mdm[0]
    values = [var.tag_app_mdm[1]]
  }
}

# 💕 Tag Assign For Infomatica MDM "EC2-Instances" -- STAGE/PROD
# resource "newrelic_entity_tags" "ec2_mdm_app_stage_node1_ec2tag" {
#   guid = var.ec2_mdm_app_stage_node1.Entity_GUID
#   # Environment
#   tag {
#     key    = var.tag_env_prod[0]
#     values = [var.tag_env_prod[1]]
#   }
#   # EC2-Instance Name
#   tag {
#     key    = var.tag_ec2_name[0]
#     values = [var.ec2_mdm_app_stage_node1.Instance_Name]
#   }
#   # Application Name
#   tag {
#     key    = var.tag_app_mdm[0]
#     values = [var.tag_app_mdm[1]]
#   }
# }
# resource "newrelic_entity_tags" "ec2_mdm_app_stage_node2_ec2tag" {
#   guid = var.ec2_mdm_app_stage_node2.Entity_GUID
#   # Environment
#   tag {
#     key    = var.tag_env_prod[0]
#     values = [var.tag_env_prod[1]]
#   }
#   # EC2-Instance Name
#   tag {
#     key    = var.tag_ec2_name[0]
#     values = [var.ec2_mdm_app_stage_node2.Instance_Name]
#   }
#   # Application Name
#   tag {
#     key    = var.tag_app_mdm[0]
#     values = [var.tag_app_mdm[1]]
#   }
# }
# resource "newrelic_entity_tags" "ec2_mdm_app_stage_enhans_ec2tag" {
#   guid = var.ec2_mdm_app_stage_enhans.Entity_GUID
#   # Environment
#   tag {
#     key    = var.tag_env_prod[0]
#     values = [var.tag_env_prod[1]]
#   }
#   # EC2-Instance Name
#   tag {
#     key    = var.tag_ec2_name[0]
#     values = [var.ec2_mdm_app_stage_enhans.Instance_Name]
#   }
#   # Application Name
#   tag {
#     key    = var.tag_app_mdm[0]
#     values = [var.tag_app_mdm[1]]
#   }
# }
# resource "newrelic_entity_tags" "ec2_mdm_app_prod_node1_ec2tag" {
#   guid = var.ec2_mdm_app_prod_node1.Entity_GUID
#   # Environment
#   tag {
#     key    = var.tag_env_prod[0]
#     values = [var.tag_env_prod[1]]
#   }
#   # EC2-Instance Name
#   tag {
#     key    = var.tag_ec2_name[0]
#     values = [var.ec2_mdm_app_prod_node1.Instance_Name]
#   }
#   # Application Name
#   tag {
#     key    = var.tag_app_mdm[0]
#     values = [var.tag_app_mdm[1]]
#   }
# }
# resource "newrelic_entity_tags" "ec2_mdm_app_prod_node2_ec2tag" {
#   guid = var.ec2_mdm_app_prod_node2.Entity_GUID
#   # Environment
#   tag {
#     key    = var.tag_env_prod[0]
#     values = [var.tag_env_prod[1]]
#   }
#   # EC2-Instance Name
#   tag {
#     key    = var.tag_ec2_name[0]
#     values = [var.ec2_mdm_app_prod_node2.Instance_Name]
#   }
#   # Application Name
#   tag {
#     key    = var.tag_app_mdm[0]
#     values = [var.tag_app_mdm[1]]
#   }
# }

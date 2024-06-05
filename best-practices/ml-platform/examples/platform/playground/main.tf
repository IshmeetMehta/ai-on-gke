# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

locals {
  configsync_repository = module.configsync_repository
  # https://github.com/hashicorp/terraform-provider-google/issues/13325
  connect_gateway_host_url = "https://connectgateway.googleapis.com/v1/projects/${data.google_project.environment.number}/locations/global/gkeMemberships/${google_container_cluster.mlp.name}"
  git_repository           = replace(local.configsync_repository.html_url, "/https*:\\/\\//", "")
  kubeconfig_dir           = abspath("${path.module}/kubeconfig")
}

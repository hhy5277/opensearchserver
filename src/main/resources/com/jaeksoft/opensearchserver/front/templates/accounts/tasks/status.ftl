<!DOCTYPE html>
<#--
   Copyright 2017-2018 Emmanuel Keller / Jaeksoft
   <p>
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
   <p>
   http://www.apache.org/licenses/LICENSE-2.0
   <p>
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Active Tasks - OpenSearchServer</title>
    <#include '../../includes/head.ftl'>
</head>
<body>
<#include '../../includes/nav.ftl'>
<#include '../../includes/messages.ftl'>
<div class="container">
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/accounts">Accounts</a></li>
            <li class="breadcrumb-item"><a href="/accounts/${account.name?url}">${account.name?html}</a></li>
            <li class="breadcrumb-item"><a href="/accounts/${account.name?url}/tasks">Tasks</a></li>
            <li class="breadcrumb-item active">${task.taskId}</li>
        </ol>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Task status</h5>
                    <table class="table">
                        <tr>
                            <th>Session start time</th>
                            <td>${task.sessionTimeId?number_to_datetime}</td>
                        </tr>
                        <tr>
                            <th>Type</th>
                            <td>${task.type?capitalize}</td>
                        </tr>
                        <tr>
                            <th>Status</th>
                            <td>${task.status!'Not yet started'?capitalize}</td>
                        </tr>
                        <tr>
                            <th>Status time</th>
                            <td><#if task.statusTime??>${task.statusTime?number_to_datetime}</#if></td>
                        </tr>
                        <tr>
                            <th>Status info</th>
                            <td>${task.statusInfo!?html}</td>
                        </tr>
                    </table>
                </div>
                <#if task.status??>
                <div class="card-footer">
                    <form class="form-inline" method="post">
                        <#if task.status.pausable>
                            <button class="btn btn-warning" name="action" value="pause" type="submit">Pause</button>
                        </#if>
                        <#if task.status.activable>
                            <button class="btn btn-success" name="action" value="start" type="submit">Activate</button>
                        </#if>
                        <#if task.status.removable>
                            <button class="btn btn-danger" name="action" value="remove" type="submit">Remove</button>
                        </#if>
                    </form>
                </div>
                </#if>
            </div>
        </div>
        <#if infos?has_content>
            <#if infos.crawlStatusCount?has_content>
            <div class="col-md-3">
                <#assign crawlStatusCount = infos.crawlStatusCount>
                <#include '../indexes/includes/crawl_status.ftl'>
            </div>
            </#if>
            <#if infos.indexStatusCount?has_content>
            <div class="col-md-3">
                <#assign indexStatusCount = infos.indexStatusCount>
                <#include '../indexes/includes/index_status.ftl'>
            </div>
            </#if>
        </#if>
    </div>
</div>
<#include '../../includes/foot.ftl'>
</body>
</html>
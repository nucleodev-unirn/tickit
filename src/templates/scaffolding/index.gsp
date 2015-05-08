<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<ol class="breadcrumb">
				%{--<li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
				<li class="active">Listagem</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
					<div class="box-tools pull-right">
						<g:link class="btn btn-default btn-box-tool" action="create"><i class="fa fa-plus"></i> <g:message code="default.new.label" args="[entityName]" /></g:link>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-12">
							<g:form action="index">
								<div class="input-group margin-bottom-10">
									<g:textField name="q" class="form-control input-sm  pull-right" placeholder="Pesquisar" style="width: 150px;" value="\${query}"/>
									<div class="input-group-btn">
										<button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
									</div>
								</div>
							</g:form>
						</div>
						<div class="col-xs-12">
							<g:if test="\${flash.message}">
								<div class="message" role="status">\${flash.message}</div>
							</g:if>
							<table class="table table-bordered table-condensed">
								<thead>
								<tr>
									<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
									allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
									props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
									Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
									props.eachWithIndex { p, i ->
										cp = domainClass.constrainedProperties[p.name]
										isVisible = cp?.attributes?.showInList != null?cp?.attributes?.showInList:true
										if (isVisible) {
											if (p.isAssociation()) { %>
									<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
									<%      } else { %>
									<g:sortableColumn params="[q: "\${query?:''}"]" property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
									<%  }   }   } %>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
									<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
										<%  props.eachWithIndex { p, i ->
											cp = domainClass.constrainedProperties[p.name]
											isVisible = cp?.attributes?.showInList != null?cp?.attributes?.showInList:true
											if (isVisible) { %>
										<%   if (p.type == Boolean || p.type == boolean) { %>
										<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
										<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
										<td><g:formatDate date="\${${propertyName}.${p.name}}" format="${p.name == 'dateCreated' || p.name == 'lastUpdated'?'dd/MM/yyyy HH:mm':'dd/MM/yyyy'}"/></td>
										<%          } else { %>
										<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
										<%  }   }   } %>
										<td class="text-center">
											<g:link class="btn btn-xs btn-default" action="edit" id="\${${propertyName}.id}" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil"></i></g:link>
											<g:link class="btn btn-xs btn-danger" action="edit" id="\${${propertyName}.id}" data-toggle="tooltip" data-placement="bottom" title="Remover"><i class="glyphicon glyphicon-remove"></i></g:link>
										</td>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate params="[q: "\${query?:''}"]" class="pagination-sm" total="\${${propertyName}Count ?: 0}" />
							</div>
						</div>
					</div>
				</div><!-- /.box-body -->
			</div><!-- /.box -->

		</section>
	<g:javascript>
        \$(document).ready(function(){
            TICKIT.selectMenu("${domainClass.propertyName}Opt");
        });
	</g:javascript>
	</body>
</html>

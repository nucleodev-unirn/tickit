import grails.util.Environment
import org.apache.log4j.*


// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password', 'passwordRepeat', 'passwordConfirm']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// config do twitter-bootstrap
grails.plugins.twitterbootstrap.fixtaglib = true

// configuracoes do asset-pipeline
grails.assets.bundle=true
grails.assets.minifyJs = false


// config do log4j
//     Example of changing the log pattern for the default console appender:
//    appenders {
//        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
//    }
//  set log level para artefatos: controllers, services, domain, filters, conf, taglib
//  log levels: off, fatal, error, warn, info, debug, trace, all
log4j = {

    info 'grails.app.controllers'
    info 'grails.app.services'
    info 'br.com.sigsoftware'
    info 'br.com.esig'
    error 'br.com.sigsoftware'
    error 'br.com.esig'

    def logSimplePattern = new PatternLayout("[%p] [%c{3}] %m%n")
    def logLayoutPattern = new PatternLayout("%d{yyyy-MM-dd/HH:mm:ss.SSS} [%t] %x %-5p %c{2} - %m%n")

    appenders {

        appender new DailyRollingFileAppender(name: "customAppender",
                threshold: Level.toLevel("INFO"),
                file: "logs/tickit.log",
                datePattern: "'['yyyy-MM-dd'].log'",   //Rollover at midnight each day.
                layout: logLayoutPattern
        )

        appender new ConsoleAppender(name: "console",
                threshold: Level.toLevel("INFO"),
                layout: logSimplePattern
        )
    }

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'

    debug stdout:  'grails.app.controllers'
    info stdout:  'grails.app.services'

    List<String> loggers = []
    loggers.add('customAppender')
    if (Environment.current.name == "development" || Environment.current.name == "test") {
        loggers.add('console')
    }

    root {
        debug loggers as String[]
        additivity = true
    }
}


// criar conta de email para projeto e configurar opções aqui.
grails.mail.default.from="tickit@unirn.edu.br"
grails {
    mail {
        host = "mail.unirn.edu.br"
        port = 587
        username = "tickit@unirn.edu.br"
        password = "senha123"
        props = ["mail.smtp.auth":"true",
                 "mail.smtp.socketFactory.port":"587"/*,
                 "mail.smtp.socketFactory.fallback":"false"*/]
//        host = "smtp.gmail.com.br"
//        username = "exemplo@gmail.com"
    }
}


// configurações do plugin angularjs
//grails.plugin.angularjs.version = "1.4.8"
//grails.plugin.angularjs.i18n = ["pt-br", "de-de", "en-us"]
//grails.plugin.angularjs.modules = ["animate", "cookies", "loader", "mocks", "resource", "route", "sanitize", "touch"]
//grails.plugin.angularjs.resourcesDisposition = "head"
//grails.plugin.angularjs.resourcesNominify = true
//grails.plugin.angularjs.autoDownload = true


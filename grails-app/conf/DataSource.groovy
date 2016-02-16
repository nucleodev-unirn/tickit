dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            driverClassName = "org.postgresql.Driver"
            dialect='org.hibernate.dialect.PostgreSQLDialect'
            dbCreate = "update" // one of 'cadastrar', 'cadastrar-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
//            url = "jdbc:postgresql://localhost:5432/tickit_develop"
//            url = "jdbc:postgresql://nucleodev.unirn.edu.br:5432/tickit_develop"
//            username='tickit_app_role'
//            password='tickit_app_role'

            // configurações de acesso ao banco de dados no heroku.com
            url = "jdbc:postgres://evnjpeywlsfyjs:spo8nIEOOBwICG5jm-wRBM5egn@ec2-54-225-223-40.compute-1.amazonaws.com:5432/deokbum1o7ipni"
            username='evnjpeywlsfyjs'
            password='spo8nIEOOBwICG5jm-wRBM5egn'

            loggingSql = true

        }
    }
    test {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"

            // configurações de acesso ao banco de dados no heroku.com
            url = "jdbc:postgres://evnjpeywlsfyjs:spo8nIEOOBwICG5jm-wRBM5egn@ec2-54-225-223-40.compute-1.amazonaws.com:5432/deokbum1o7ipni"
            username='evnjpeywlsfyjs'
            password='spo8nIEOOBwICG5jm-wRBM5egn'

            loggingSql = true
        }
    }
    production {
        dataSource {
            driverClassName = "org.postgresql.Driver"
            dialect='org.hibernate.dialect.PostgreSQLDialect'
            dbCreate = "update" // one of 'cadastrar', 'cadastrar-drop', 'update', 'validate', ''
//            url = "jdbc:postgresql://localhost:5432/tickit_develop"
//            url = "jdbc:postgresql://nucleodev.unirn.edu.br:5432/tickit_develop"
			
			// configurações de acesso ao banco de dados no heroku.com
			url = "jdbc:postgres://evnjpeywlsfyjs:spo8nIEOOBwICG5jm-wRBM5egn@ec2-54-225-223-40.compute-1.amazonaws.com:5432/deokbum1o7ipni"
            username='evnjpeywlsfyjs'
            password='spo8nIEOOBwICG5jm-wRBM5egn'
			
            loggingSql = true
			
            /*dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }*/
        }
    }
}

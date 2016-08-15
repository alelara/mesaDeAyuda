dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect="org.hibernate.dialect.PostgreSQLDialect"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

environments {
    development {
        dataSource {
            username = "rt"
            password = "rt2015"
            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/mesa_ayuda"
        }
    }
    test {
        dataSource {
            username = "rt"
            password = "rt2015"
            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/mesa_ayuda"
        }
    }
    production {
        dataSource {
            username = "rt"
            password = "rt2015"
            dbCreate = "update"
            url = "jdbc:postgresql://10.8.254.93:5432/mesa_ayuda"
        }
    }
}

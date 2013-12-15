package org.bgrimm.utils;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.SQLServerDialect;

public class MySQLServerDialect extends SQLServerDialect {
	public MySQLServerDialect() {
		super();
		//registerHibernateType(Types.REAL, "float");
		registerColumnType(Types.DOUBLE, "real");
	}
}

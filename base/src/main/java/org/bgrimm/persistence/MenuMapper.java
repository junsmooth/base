package org.bgrimm.persistence;

import java.util.List;

import org.bgrimm.domain.Menu;

public interface MenuMapper {

	List<Menu> getMenusByParentId(int parent);
}

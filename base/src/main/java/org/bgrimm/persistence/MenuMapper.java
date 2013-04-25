package org.bgrimm.persistence;

import java.util.List;

import org.bgrimm.domain.system.TMenu;

public interface MenuMapper {

	List<TMenu> getMenusByParentId(int parent);
}

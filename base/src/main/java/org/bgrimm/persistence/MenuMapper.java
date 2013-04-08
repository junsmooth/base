package org.bgrimm.persistence;

import java.util.List;

import org.bgrimm.domain.core.TMenu;

public interface MenuMapper {

	List<TMenu> getMenusByParentId(int parent);
}

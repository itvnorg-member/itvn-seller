<?php
function set_active($path, $active = 'active')
{
	return call_user_func_array('Request::is', (array)$path) ? $active : '';
}

function make_tree($array, $parent = 0){
	if (count($array) <= 0) {
		return false;
	}

	$result = [];
	foreach ($array as $key => $value) {
		if ($value->parent_id == $parent) {
			$result[$value->id] = [
				'name'	=>	$value['name'],
				'level'	=>	$value['level'],
				'parent_id'	=>	$value['parent_id'],
				'children'	=>	make_tree($array, $value->id)
			];
		}
	}
	return $result;
}

function option_menu($array, $parent = 0, $text = "", $select = 0, $result = ''){
	foreach ($array as $key => $value) {
		if ($parent == $value['parent_id']) {
			$result .= "<option value='".$key."'>".$text.$value['name']."</option>";
			if (count($value['children']) > 0) {
				$result .= option_menu($value['children'], $key, $text."|_", 0, $result);
			}

			unset($array[$key]);
		}
	}
	return $result;
}
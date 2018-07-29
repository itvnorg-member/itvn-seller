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
				'children'	=>	make_tree($array, $value->id)
			];
		}
	}
	return $result;
}

function option_menu($array, $text = "", $select = 0, $result = ''){
	foreach ($array as $key => $value) {
		if ($select != 0 && $select == $key) {
			$result .= "<option value='".$key."' selected='selected'>".$text.$value['name']."</option>";
		}else{
			$result .= "<option value='".$key."'>".$text.$value['name']."</option>";
		}
		
		if (count($value['children']) > 0) {
			$result .= option_menu($value['children'], $text."|_", $select);
		}

		unset($array[$key]);
	}
	return $result;
}

function make_list_hierarchy($array, $result = ''){
	$result .= '<ul>';
	foreach ($array as $key => $value) {
		$result .= '<li>
		<div class="checkbox">
		<label><input type="checkbox" value="'.$key.'">'.$value['name'].'</label>
		</div>
		</li>';
		
		if (count($value['children']) > 0) {
			$result .= make_list_hierarchy($value['children']);
		}

		unset($array[$key]);
	}
	$result .= '</ul>';
	return $result;
}

function format_price($price)
{
	return number_format($price) . ' VND';
}
if live_call() return live_result;

event_inherited();

searchBar=instance_create_depth(-100, -100, depth-1, shrimpleSearchBar);
ds_list_add(children, searchBar);

searchButton=instance_create_depth(-100, -100, depth-1, textButton);
with searchButton {
	canDeactivate=false;
	text="Shearch";
}
ds_list_add(children, searchButton);
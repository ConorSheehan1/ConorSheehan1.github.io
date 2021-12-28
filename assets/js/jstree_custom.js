$(document).ready(() => {
  const theme = getSavedTheme() === "light" ? "default" : "default-dark";
  console.log(theme);
  $('#projects_tree').jstree({
    core: {
      themes: {
        name: theme,
        dots: true,
        icons: false
      },
    },
    plugins: ["theme", "html_data", "types", "search"],
    search: {
      "case_insensitive": true,
      "show_only_matches" : true
    },
  });

  $('#projects_tree').bind("select_node.jstree", function (e, data) {
    $('#jstree').jstree('save_state');
  });

  $('#projects_tree').on("activate_node.jstree", function(e,data){
     window.location.href = data.node.a_attr.href;
  })

  $('#projects-search').keyup(function(){
    $('#projects_tree').jstree('search', $(this).val());
  });
});
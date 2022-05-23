$('#stadium_select').html(
  "<%= j(select :post, :stadium_id, options_from_collection_for_select(@stadium, :id, :name)) %>"
  );


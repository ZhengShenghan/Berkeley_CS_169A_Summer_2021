```erb
<div class="container-fluid">
  <div class="row">
    <div class="col-md-8 offset-md-2">
      <div class="table-responsive-md pt-5">
        <table class="table table-striped table-hover" id="events">
          <caption>Table of Representatives</caption>
          <thead class="thead-dark">
            <tr>
              <th>Name</th>
              <th>Office</th>
              <th>Links</th>
            </tr>
          </thead>
          <tbody>
            <% @representatives.each_with_index do |rep, _index| %>
              <tr>
                <td>
                  <%= rep.name %>
                </td>
                <td>
                  <%= rep.title %>
                </td>
                <td>
                  <%= link_to representative_news_items_path(rep.id), class: 'btn btn-primary' do %>
                    <i class="fas fa-newspaper"></i>
                    News Articles
                  <% end %>
                </td>
              </tr>
            <% end %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>



<div class = 'row'>
    <% @representatives.each_with_index do |rep, _index| %>
    <tr>
        <td>
            <%= rep.name%>
        </td>
        <td>
            <%= rep.party%>
        </td>
        <td>
            <%= rep.address%>
        </td>
        <td>
            <%= imag_tag rep.photoUrl%>
        </td>
        <td>
            <%= rep.title%>
        </td>
    </tr>
</div>
```


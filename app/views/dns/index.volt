<div class="row">
  <div class="col-lg-12">
    <h1>Welcome to Peppermint.Cloud DNS</h1>
    <hr>
    <p>This is your DNS Home-Page. Here you can search for Domains or just Create a new one.</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-6">
    {{ link_to("dns/search", '<i class="fas fa-search"></i> Search for Domain', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-6">
    {{ link_to("dns/create", '<i class="fas fa-plus"></i> Create new Domain', "class": "btn btn-success form-control") }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <table class="table table-striped table-borderless">
      {% for domain in domains.items %}
        {% if loop.first %}
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Name</th>
              <th scope="col" colspan="2"></th>
            </tr>
          </thead>
          <tbody>
        {% endif %}
          <tr>
            <th scope="row">#{{ domain.id }}</th>
            <td>{{ domain.name }}</td>
            <td>{{ link_to('dns/edit/' ~ domain.id,'<i class="fas fa-edit"></i> Edit','class':'btn btn-primary form-control') }}</td>
            <td>{{ link_to('dns/delete/' ~ domain.id,'<i class="fas fa-trash"></i> Delete','class':'btn btn-danger form-control') }}</td>
          </tr>
        {% else %}
          <tr>
            <td colspan="3">You don't have any domains.</td>
            <td>{{ link_to('dns/create','<i class="fas fa-plus"></i> Create one!','class':'btn btn-success form-control') }}</td>
          </tr>
        {% endfor %}
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="col-lg-2">
    {{ link_to("dns/index", '<i class="fas fa-angle-double-left"></i> First', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/index?page=" ~ domains.before, '<i class="fas fa-angle-left"></i> Previous', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-4">
    <p class="form-control">{{ domains.current }}/{{ domains.total_pages }}</p>
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/index?page=" ~ domains.next, 'Next <i class="fas fa-angle-right"></i>', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/index?page=" ~ domains.last, 'Last <i class="fas fa-angle-double-right"></i>', "class": "btn btn-primary form-control") }}
  </div>
</div>
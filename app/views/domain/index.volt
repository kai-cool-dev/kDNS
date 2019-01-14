<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            {% if name %}
              <h1><i class="fas fa-search"></i> Search for "{{ name }}"</h1>
            {% else %}
              <h1><i class="fas fa-columns"></i> Domain Overview</h1>
            {% endif %}
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <a class="btn btn-primary form-control" onclick="display_search()"><i class="fas fa-search"></i> Search for Domain</a>
          </div>
          <div class="col-lg-6">
            {{ link_to("domain/create", '<i class="fas fa-plus"></i> Create new Domain', "class": "btn btn-success form-control") }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        {{ form('domain/','class': 'form-search', 'id': 'searchform') }}
          <div class="row">
            <div class="col-lg-10">
              {{ form.render('name') }}
            </div>
            <div class="col-lg-2">
              <button class="form-control btn btn-success"><i class="fas fa-search"></i> Search</button>
            </div>
          </div>
        </form>
        <div class="row">
          <div class="col-lg-12">
            <table class="table table-striped table-borderless">
              {% for domain in domains.items %}
                {% if loop.first %}
                  <thead>
                  </thead>
                  <tbody>
                {% endif %}
                  <tr>
                    <th scope="row">{{ domain.name }}</th>
                    <td>{{ link_to('domain/edit/' ~ domain.id,'<i class="fas fa-info-circle"></i> Details','class':'btn btn-primary form-control') }}</td>
                  </tr>
                {% else %}
                  <tr>
                    <td colspan="2">You don't have any domains.</td>
                    <td>{{ link_to('domain/create','<i class="fas fa-plus"></i> Create one!','class':'btn btn-success form-control') }}</td>
                  </tr>
                {% endfor %}
              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-2">
            {{ link_to("domain/index", '<i class="fas fa-angle-double-left"></i> First', "class": "btn btn-primary form-control") }}
          </div>
          <div class="col-lg-2">
            {{ link_to("domain/index?page=" ~ domains.before, '<i class="fas fa-angle-left"></i> Previous', "class": "btn btn-primary form-control") }}
          </div>
          <div class="col-lg-4">
            <p class="form-control">{{ domains.current }}/{{ domains.total_pages }}</p>
          </div>
          <div class="col-lg-2">
            {{ link_to("domain/index?page=" ~ domains.next, 'Next <i class="fas fa-angle-right"></i>', "class": "btn btn-primary form-control") }}
          </div>
          <div class="col-lg-2">
            {{ link_to("domain/index?page=" ~ domains.last, 'Last <i class="fas fa-angle-double-right"></i>', "class": "btn btn-primary form-control") }}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

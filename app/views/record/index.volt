<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1>List Records of {{ link_to('domain/edit/' ~ domain.id,domain.name) }}</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        {% for record in records.items %}
        {% if loop.first %}
        <div class="row">
          <div class="col-lg-12">
            <table class="table table-striped table-borderless">
              <thead>
                <th scope="col">Name</th>
                <th scope="col">Type</th>
                <th scope="col">Content</th>
                <th scope="col" colspan="4"></th>
              </thead>
              <tbody>
                <tr>
                  <form method="post" action="{{ url('record/create/' ~ domain.id) }}">
                    <td>
                      <div class="input-group">
                        {{ new_record.render('name') }}
                        <div class="input-group-append">
                          <span class="input-group-text">.{{ domain.name }}</span>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="input-group">
                        {{ new_record.render('type') }}
                      </div>
                    </td>
                    <td>
                      <div class="input-group">
                        {{ new_record.render('content') }}
                      </div>
                    </td>
                    <td colspan="4">
                      <button type="submit" class="btn form-control btn-success" data-toggle="tooltip" data-placement="bottom" title="Create new Record"><i class="fas fa-plus"></i> Create</button>
                    </td>
                  </form>
                </tr>
        {% endif %}
                <tr>
                  <th scope="row"><div class="input-group"><input type="text" class="form-control" value="{{ record.name }}" disabled></div></th>
                  <td><div class="input-group"><input type="text" class="form-control" value="{{ record.type }}" disabled></div></td>
                  <th scope="row"><div class="input-group"><input type="text" class="form-control" value='{{ record.content }}' disabled></div></th>
                {% if record.type is not "SOA" and record.type is not "NS" %}
                  <td><button class="btn form-control btn-primary" id="edit_button" data-toggle="tooltip" data-placement="bottom" title="Edit this Record"><i class="fas fa-edit"></i></button></td>
                  <td><button class="btn form-control btn-secondary" id="ttl_button" data-toggle="tooltip" data-placement="bottom" title="Change TTL or Priority of the Record"><i class="far fa-calendar-check"></i></button></td>
                  {% if record.disabled == 0 %}
                    <td>{{ link_to('record/disable/' ~ domain.id ~ '/' ~ record.id,'<i class="fas fa-ban"></i>','class':'btn btn-warning form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Disable Record') }}</td>
                  {% else %}
                    <td>{{ link_to('record/enable/' ~ domain.id ~ '/' ~ record.id,'<i class="fas fa-check"></i>','class':'btn btn-success form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Enable Record') }}</td>
                  {% endif %}
                  <td>{{ link_to('record/delete/' ~ domain.id ~ '/' ~ record.id,'<i class="fas fa-trash"></i>','class':'btn btn-danger form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Delete Record') }}</td>
                {% else %}
                  <td colspan="4"></td>
                {% endif %}
                </tr>
        {% if loop.last %}
              </tbody>
            </table>
          </div>
        </div>
        {% endif %}
        {% endfor %}
        {% if records.next  > 1 %}
          <div class="row">
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-double-left"></i> First</button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <input type="hidden" name="page" value="{{ records.before }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-left"></i> Previous</button>
              </form>
            </div>
            <div class="col-lg-4">
              <p class="form-control">{{ records.current }}/{{ records.total_pages }}</p>
            </div>
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <input type="hidden" name="page" value="{{ records.next }}">
                <button type="submit" class="btn btn-primary form-control">Next <i class="fas fa-angle-right"></i></button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <input type="hidden" name="page" value="{{ records.last }}">
                <button type="submit" class="btn btn-primary form-control">Last <i class="fas fa-angle-double-right"></i></button>
              </form>
            </div>
          </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>

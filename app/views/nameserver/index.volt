<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1>List Nameserver</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <p>{{ link_to('nameserver/create','<i class="fas fa-plus"></i> Create','class':'btn btn-success form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Create new nameserver') }}</p>
          </div>
        </div>
        {% for nameserver in nameservers.items %}
          {% if loop.first %}
          <div class="row">
            <div class="col-lg-12">
              <table class="table table-striped table-borderless">
                <thead>
                  <th scope="col">Name</th>
                  <th scope="col">Type</th>
                  <th scope="col">Description</th>
                  <th scope="col"></th>
                </thead>
                <tbody>
          {% endif %}
                <tr>
                  <th>{{ nameserver.name }}</th>
                  <td>{{ nameserver.type }}</td>
                  <td>{{ nameserver.description }}</td>
                  <td>{{ link_to('nameserver/edit/' ~ nameserver.id ~ '/','<i class="fas fa-info-circle"></i> Details','class':'btn btn-primary form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Show Nameserver details') }}</td>
                </tr>
          {% if loop.last %}
                </tbody>
              </table>
            </div>
          </div>
          {% endif %}
        {% endfor %}
        {% if nameservers.next  > 1 %}
          <div class="row">
            <div class="col-lg-2">
              {{ form('nameserver/index') }}
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-double-left"></i> First</button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('nameserver/index') }}
                <input type="hidden" name="page" value="{{ nameservers.before }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-left"></i> Previous</button>
              </form>
            </div>
            <div class="col-lg-4">
              <p class="form-control">{{ nameservers.current }}/{{ nameservers.total_pages }}</p>
            </div>
            <div class="col-lg-2">
              {{ form('nameserver/index') }}
                <input type="hidden" name="page" value="{{ nameservers.next }}">
                <button type="submit" class="btn btn-primary form-control">Next <i class="fas fa-angle-right"></i></button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('nameserver/index') }}
                <input type="hidden" name="page" value="{{ nameservers.last }}">
                <button type="submit" class="btn btn-primary form-control">Last <i class="fas fa-angle-double-right"></i></button>
              </form>
            </div>
          </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>

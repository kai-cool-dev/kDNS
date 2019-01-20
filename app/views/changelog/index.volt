<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
					<div class="col-lg-12">
						<h1><i class="far fa-file-alt"></i> List Changelog</h1>
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
            {% for changelog in changelogs.items %}
              {% if loop.first %}
              <table class="table table-striped table-borderless">
                <thead>
                  <tr>
				            <th>ID</th>
                    <th>Type</th>
                    <th>UID</th>
                    <th>Date</th>
                    <th></th>
				          </tr>
                </thead>
                <tbody>
              {% endif %}
              <tr>
                <th scope="row"># {{ changelog.id }}</th>
                <td>{{ changelog.type }}</td>
                <td>{{ link_to("users/edit/" ~ changelog.uid.id, changelog.uid.name) }}</td>
                <td>{{ changelog.date }}</td>
                <td>{{ link_to("changelog/show/" ~ changelog.id ~ '/', '<i class="fas fa-search"></i> Show', "class": "btn btn-primary form-control") }}</td>
              </tr>
              {% if loop.last %}
                </tbody>
                  </table>
              {% endif %}
            {% endfor %}
          </div>
        </div>
        {% if changelogs.next  > 1 %}
          <div class="row">
            <div class="col-lg-2">
              {{ form('changelog/') }}
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-double-left"></i> First</button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('changelog/') }}
                <input type="hidden" name="page" value="{{ changelogs.before }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-left"></i> Previous</button>
              </form>
            </div>
            <div class="col-lg-4">
              <p class="form-control">{{ changelogs.current }}/{{ changelogs.total_pages }}</p>
            </div>
            <div class="col-lg-2">
              {{ form('changelog/') }}
                <input type="hidden" name="page" value="{{ changelogs.next }}">
                <button type="submit" class="btn btn-primary form-control">Next <i class="fas fa-angle-right"></i></button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('changelog/') }}
                <input type="hidden" name="page" value="{{ changelogs.last }}">
                <button type="submit" class="btn btn-primary form-control">Last <i class="fas fa-angle-double-right"></i></button>
              </form>
            </div>
          </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>

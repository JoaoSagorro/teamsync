class SearchController < ApplicationController
  def search
    @team = current_user.team
    if params[:search].present?
      results = PgSearch.multisearch(params[:search])
    end

    if !results.nil?
      players = results.select { |result| result.searchable_type == "Player" }
      @players = players.map { |player| player.searchable}

      employees = results.select { |result| result.searchable_type == "Employee" }
      @employees = employees.map { |employee| employee.searchable}

      events = results.select { |result| result.searchable_type == "Event" }
      @events = events.map { |event| event.searchable}
      @events = @events.sort_by { |key| key[:start_date] }
    end
  end
end

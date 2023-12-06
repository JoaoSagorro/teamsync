class SearchController < ApplicationController
  def search
    @team = current_user.team
    if params[:search].present?
      PgSearch::Multisearch.rebuild(Player)
      results = PgSearch.multisearch(params[:search])
    end

    if !results.nil?
      players = results.select { |result| result.searchable_type == "Player" }
      @players = players.map { |player| player.searchable}

      employees = results.select { |result| result.searchable_type == "Employee" }
      @employees = employees.map { |employee| employee.searchable}

      events = results.select { |result| result.searchable_type == "Event" }
      @events = events.map { |event| event.searchable}
    end
  end
end

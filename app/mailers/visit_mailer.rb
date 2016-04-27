class VisitMailer < ApplicationMailer
  def new_visit(visit)
    @visit = visit
    mail(
      to: visit.visited_attraction.creator.email,
      subject: "Someone visited #{visit.visited_attraction.name}!"
    )
  end
end

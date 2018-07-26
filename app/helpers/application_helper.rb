module ApplicationHelper
  def table_hash(table)
    hash = {}
    if table == :content_camps
      hash = {announce: "Анонс о лагере", program: "Общая программа", schedule: "Распорядок дня"}
    end
    hash
  end
end

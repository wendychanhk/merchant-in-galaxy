module Output
  def output(answer_units, answer_credits, array_questions_order)
    #to put the answers into an array with a correct order 
    array_answers_all = []
    array_questions_order.each do |order|
      case
      when order == 0
        #questions of asking the value of the galaxy unit
        array_answers_all << answer_units[0]
        answer_units.shift
      when order == 1
        #questions of asking the credits of metals 
        array_answers_all << answer_credits[0]
        answer_credits.shift
      else
        #unknown questions 
        array_answers_all << "I have no idea what you are talking about"
      end
    end
    #array of answers with orders matched with the lines in the input text file 
    array_answers_all
  end
end

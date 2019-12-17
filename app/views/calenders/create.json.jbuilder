json.array!(@numbers) do |number|
  json.id       number.id
  json.win      number.win
  json.lose     number.lose
  json.user_id  number.user_id
end
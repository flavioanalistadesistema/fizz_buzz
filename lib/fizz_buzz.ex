defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(&convert_and_valuate_numbers/1)
  end
  def handle_file_read({:error, msg}), do: "Não foi possivel ler o arquivo. Menssage #{msg}"

  def convert_and_valuate_numbers(elem) do
    number = String.to_integer(elem)
    evaluate_number(number)
  end

  def evaluate_number(number) when rem(number, 3) === 0 and rem(number, 5) === 0,  do: :fizzbuzz
  def evaluate_number(number) when rem(number, 5) === 0,  do: :buzz
  def evaluate_number(number) when rem(number, 3) === 0,  do: :fizz
  def evaluate_number(number), do: number
end

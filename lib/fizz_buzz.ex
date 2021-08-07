defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
    result
    |> String.split(",")
    |> Enum.map(&convert_and_valuate_numbers/1)
    {:ok, result}
  end

  defp handle_file_read({:error, msg}), do: {:error , "Não foi possivel ler o arquivo. Menssage #{msg}"}

  defp convert_and_valuate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 3) === 0 and rem(number, 5) === 0,  do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 5) === 0,  do: :buzz
  defp evaluate_number(number) when rem(number, 3) === 0,  do: :fizz
  defp evaluate_number(number), do: number
end

defmodule Elx.CLI do
  @setup """
  import Enum, except: [split: 1, split: 2]
  import String
  import IO


  """

  def main(args) do
    first_arg = hd(args)
    text = IO.read(:all)

    {result, _} = Code.eval_string( @setup <> "; \"#{text}\" |> #{first_arg}")
    to_string result
    |> IO.write
  end
end

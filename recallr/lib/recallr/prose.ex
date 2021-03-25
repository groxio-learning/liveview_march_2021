defmodule Recallr.Prose do

  defstruct [:text, :rounds, :name]

  def first, do: :spock

  def next(:terminator), do: :lor
  def next(:lor), do: :spock
  def next(:spock), do: :jojo
  def next(:jojo), do: :princess_bride
  def next(:princess_bride), do: :megamind
  def next(:megamind), do: :terminator

  def find(:terminator) do
    %__MODULE__{text: "I'll be back!", rounds: 3}
  end

  def find(:lor) do
    text =
    """
    A wizard is never late nor is he early,
    he arrives precisely when he means to.
    """
    %__MODULE__{text: text, rounds: 4}
  end

  def find(:spock) do
    text =
    """
    Live long and prosper, my friend.
    """
    %__MODULE__{text: text, rounds: 2}
  end

  def find(:jojo) do
    text =
    """
    I think you'll find that metal is the strongest thing in the world,
    followed closely by dynamite, and then muscles.
    """
    %__MODULE__{text: text, rounds: 3}
  end

  def find(:princess_bride) do
    text =
    """
    Hello, my name is Inigo Montoya. You killed my father.
    Prepare to die.
    """
    %__MODULE__{text: text, rounds: 4}
  end

  def find(:megamind) do
    text =
    """
    Incredibly handsome criminal genius and master of all villany!
    """
    %__MODULE__{text: text, rounds: 4}
  end

end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

      Recallr.Repo.delete_all(Recallr.Library.Passage)
      Recallr.Repo.insert!(%Recallr.Library.Passage{name: "spock", rounds: 2, text: "Live long and prosper, my friend."})
      Recallr.Repo.insert!(%Recallr.Library.Passage{name: "lor", rounds: 4, text: "  A wizard is never late nor is he early,
        he arrives precisely when he means to."})
      Recallr.Repo.insert!(%Recallr.Library.Passage{name: "jojo", rounds: 3, text: "I think you'll find that metal is the strongest thing in the world,
        followed closely by dynamite, and then muscles."})
      Recallr.Repo.insert!(%Recallr.Library.Passage{name: "princess_bride", rounds: 4, text: "Hello, my name is Inigo Montoya. You killed my father.
          Prepare to die."})
      Recallr.Repo.insert!(%Recallr.Library.Passage{name: "megamind", rounds: 4, text: "Incredibly handsome criminal genius and master of all villany!"})

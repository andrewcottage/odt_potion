# OdtPotion

## To use

Add a placeholder to your odt such as [LAST_NAME] and save it.

Then in your code use

```
OdtPotion.replace_in_odt("path/to/odt/file.odt", "[LAST_NAME]", "Smith")
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add odt_potion to your list of dependencies in `mix.exs`:
```
  def deps do
    [{:odt_potion, "~> 0.0.1"}]
  end
```
  2. Ensure odt_potion is started before your application:
```
  def application do
    [applications: [:odt_potion]]
  end
```

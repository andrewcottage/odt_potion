defmodule OdtPotion do
  @doc """
  """
  def replace_in_odt(odt_file, marker, string) do
    odt_files = files(odt_file)
    xml_content = content(odt_file)
    new_content = replace_content(xml_content, marker, string)
    write_new_file(new_content)
    repackage_odt(odt_files, odt_file)
  end

  defp repackage_odt(files, odt_file) do
    IO.puts odt_file
    :zip.create(odt_file, files)
    remove_files(files)
  end

  defp remove_files(files) do
    Enum.map files, fn file ->
      File.rm_rf file
    end
    File.rm_rf "META-INF"
    File.rm_rf "Thumbnails"
    File.rm_rf "Configurations2"
  end

  defp write_new_file(content) do
    File.write("content.xml", content)
  end

  defp replace_content(content, marker, string) do
    String.replace(content, marker, string)
  end

  defp files(odt_file) do
    {:ok, file} = File.read(odt_file)
    {:ok, files} = :zip.extract(file)
    files
  end

  defp content(odt_file) do
    xml_file = Enum.at(files(odt_file), 2)
    File.read!(xml_file)
  end

end

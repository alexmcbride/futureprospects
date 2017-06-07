# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Helper class for the Axlxs spreadsheet library. Simplifies the task of creating basic spreadsheets.
class Spreadsheet
  # Creates a new Spreadsheet object.
  def initialize
    @package = Axlsx::Package.new
    @worksheet = nil
  end

  # Reads a stream of bytes that can be sent to the browser.
  #
  # @return [StringIO]
  def get_data
    @package.to_stream.read
  end

  # Creates a new worksheet.
  #
  # @param name [String] the name of the worksheet.
  # @return [Axlsx::Worksheet]
  def add_worksheet(name)
    @worksheet = @package.workbook.add_worksheet(name: name)
  end

  # Adds a table to the current worksheet and returns an array of row objects.
  #
  # @param header [Array<String>] an array of values to use for the table header
  # @param rows [Array<String>] an array of values to use for the table rows
  # @param name [String] the name of the table
  # @return [Array<Axlsx::Row>]
  def add_table(header=[], rows=[], name='Default')
    table_rows = [@worksheet.add_row(header)]

    rows.each do |row|
      table_rows << @worksheet.add_row(row)
    end

    table_ref = "#{table_rows.first.cells.first.reference}:#{table_rows.last.cells.last.reference}".tr('$', '')
    @worksheet.add_table table_ref, name: name, style_info: {name: 'TableStyleLight13'}

    table_rows
  end

  # Adds a blank for to the current worksheet.
  def add_blank_row
    @worksheet.add_row
    @worksheet.rows.last.index + 2
  end

  # Adds a piechart to the current worksheet.
  #
  # @param title [String] the title of the chart.
  # @param table [Array<Axlsx::Row>] an array of rows containing the data (normally as returned by +add_table+).
  # @param start [Array<Integer>] a tuple holding the start position of the chart.
  # @param size [Array<Integer>] a tuple holding the size of the chart.
  def add_piechart(title, table, start=[3, 0], size=[5, 14])
    # get left column
    labels = "#{get_reference(table.second.cells.first)}:#{get_reference(table.last.cells.first)}"
    data = "#{get_reference(table.second.cells.second)}:#{get_reference(table.last.cells.last)}"

    @worksheet.add_chart(Axlsx::Pie3DChart) do |chart|
      chart.title = title
      chart.add_series :data => @worksheet[data], :labels => @worksheet[labels]
      chart.start_at start[0], start[1]
      chart.end_at start[0]+size[0], start[1]+size[1]
    end
  end

  # Adds a linechart to the current worksheet.
  #
  # @param title [String] the title of the chart.
  # @param table [Array<Axlsx::Row>] an array of rows containing the data (normally as returned by +add_table+).
  # @param start [Array<Integer>] a tuple holding the start position of the chart.
  # @param size [Array<Integer>] a tuple holding the size of the chart.
  def add_linechart(title, table, start=[3, 0], size=[5, 14])
    label = get_reference(table.first.cells.first)
    labels = "#{get_reference(table.second.cells.first)}:#{get_reference(table.last.cells.first)}"
    data = "#{get_reference(table.second.cells.second)}:#{get_reference(table.last.cells.last)}"

    @worksheet.add_chart(Axlsx::LineChart, start_at: start, end_at: [start[0] + size[0], start[1] + size[1]], title: title) do |chart|
      chart.add_series data: @worksheet[data], labels: @worksheet[labels], title: @worksheet[label]
      chart.d_lbls.show_val = true
      chart.d_lbls.show_cat_name = true
      chart.catAxis.tick_lbl_pos = :none
    end
  end

  # Adds a barchart to the current worksheet.
  #
  # @param title [String] the title of the chart.
  # @param table [Array<Axlsx::Row>] an array of rows containing the data (normally as returned by +add_table+).
  # @param start [Array<Integer>] a tuple holding the start position of the chart.
  # @param size [Array<Integer>] a tuple holding the size of the chart.
  def add_barchart(title, table, start=[3, 0], size=[5, 14])
    labels = "#{get_reference(table.second.cells.first)}:#{get_reference(table.last.cells.first)}"
    data = "#{get_reference(table.second.cells.second)}:#{get_reference(table.last.cells.last)}"

    @worksheet.add_chart(Axlsx::Bar3DChart, start_at: start, end_at: [start[0] + size[0], start[1] + size[1]], title: title) do |chart|
      chart.add_series data: @worksheet[data], labels: @worksheet[labels]
      chart.valAxis.label_rotation = -45
      chart.catAxis.label_rotation = 45
      chart.catAxis.tick_lbl_pos = :none
    end
  end

  private
    # Helper method for getting a cell reference (e.g. A1 or H6 etc).
    #
    # @param cell [Axlsx::Cell] the cell to find reference for
    # @return [String]
    def get_reference(cell)
      cell.reference.tr('$', '')
    end
end

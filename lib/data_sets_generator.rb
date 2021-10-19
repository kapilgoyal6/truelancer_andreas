class DataSetsGenerator

  require "rubygems"
  require "open-uri"
  require "zip/zip"
  require "fileutils"
  require "csv"

  def initialize
    @data_source = DataSource.find_by_name("OECD")
	end

	def generate
    if @data_source
      download_and_extract_zip
      import_csv
    end
	end

  def download_and_extract_zip
    url = "https://data.nasdaq.com/api/v3/databases/#{@data_source.name}/metadata?api_key=e8ZT99tPbGtffkzcbYoX"
    open( url ) {|zf|
      Zip::ZipFile.open(zf.path) do |zipfile|
      zipfile.each{|e|
        fpath = File.join("public", e.to_s)
        FileUtils.mkdir_p(File.dirname(fpath))
        zipfile.extract(e, fpath){ true }
      }
      end
    }
  end

  def import_csv
    csv_text = File.read("#{Rails.root.to_s}/public/OECD_metadata.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      data_source_metadata = @data_source.data_source_metadata.create!(row.to_hash)

      json = JSON.load(open("https://data.nasdaq.com/api/v3/datasets/#{@data_source.name}/#{data_source_metadata.code}.json?api_key=e8ZT99tPbGtffkzcbYoX"))

      json["dataset"]["data"].each do |data|
        HistoricalPriceDatum.create(date: data[0], close: data[1])
      end

    end
  end

end

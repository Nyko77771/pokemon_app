require 'net/http'
require 'json'
require 'timeout'

# My custom client for interacting with the Pokemon Price Tracker API
class PokemonAPIClient
    # URL for the Pokemon Price Tracker API
    BASE_URL = "https://www.pokemonpricetracker.com/api/v2/cards"

    # Method to configure the API client with the provided API key
    def self.configure(api_key)
        @api = api_key
    end

    # Method to fetch card data by name from the Pokemon Price Tracker API
    def self.fetch_card_by_name(name)
        # Log the card name being fetched
        puts "Fetching card #{name}"
        puts "..."

        # Handle potential timeouts and network errors
        begin
            Timeout.timeout(100) do
                # Construct the URI with query parameters
                uri = URI("#{BASE_URL}")
                # Set up query parameters
                # limit to 3 results and exclude history for better performance
                params = {
                    search: name,
                    limit: 3,
                    includeHistory: 'false'
                }
                # Encode the parameters into the URI
                uri.query = URI.encode_www_form(params)

                # Create the HTTP GET request with authorization header
                request = Net::HTTP::Get.new(uri)
                request["Authorization"] = "Bearer #{@api}"

                # Obtain the HTTP response
                response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {
                    |http| http.request(request)
                }
                # If the response is successful, parse and return the card data
                if response.code.to_i == 200
                    # Logging the status code
                    puts "Status #{response.code}"
                    # Parse the JSON response body
                    card = JSON.parse(response.body)
                    # Return the parsed data
                    return card
                else
                    # Log failure
                    puts "Failed to fetch card data. HTTP Status: #{response.code}
                    + \n Message: #{response.message}"
                    return nil
                end
            end

            # Handle timeout errors
        rescue Timeout::Error => e
            puts "Request timed out while fetching card data."
            puts "Error: #{e.message}"
            return nil
            # Handle network read timeout errors
            # This can occur if the server is taking too long to respond
        rescue Net::ReadTimeout => e
            puts "Network timeout error occurred while fetching card data."
            puts "Error: #{e.message}"
            return nil
        end
    end
end


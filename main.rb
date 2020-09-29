peso = ARGV[0].to_i
altura = ARGV[1].to_f
imc = peso / (altura**2)

imc_table = [
    {
        "intervalo_cond" => imc < 18.5,
        "intervalo_text" => 'MENOR QUE 18,5',
        "classificacao" => 'MAGREZA',
        "grau_obesidade" => '0'
    },
    {
        "intervalo_cond" => imc >= 18.5 && imc < 25,
        "intervalo_text" => 'ENTRE 18,5 E 24,9',
        "classificacao" => 'NORMAL',
        "grau_obesidade" => '0'
    },
    {
        "intervalo_cond" => imc >= 25 && imc < 30,
        "intervalo_text" => 'ENTRE 25,0 E 29,9',
        "classificacao" => 'SOBREPESO',
        "grau_obesidade" => 'I'
    },
    {
        "intervalo_cond" => imc >= 30 && imc < 40,
        "intervalo_text" => 'ENTRE 30,0 E 39,9',
        "classificacao" => 'OBESIDADE',
        "grau_obesidade" => 'II'
    },
    {
        "intervalo_cond" => imc >= 40,
        "intervalo_text" => 'MAIOR QUE 40,0',
        "classificacao" => 'OBESIDADE GRAVE',
        "grau_obesidade" => 'III'
    }
]

classificacao = imc_table.select { |e| e["intervalo_cond"] == true }.first

puts "\nSeu IMC é: #{imc.round(1)} - #{classificacao["classificacao"]}"
puts "\nIMC\t\t\tCLASSIFICAÇÃO\t\tOBESIDADE(GRAU)"
for line in imc_table
    intervalo_text = line["intervalo_text"]
    tab_intervalo_text = line["intervalo_text"].length > 15 ? "\t" : "\t\t"
    classificacao = line["classificacao"]
    tab_classificacao = line["classificacao"].length > 7 ? "\t\t" : "\t\t\t"
    grau_obesidade = line["grau_obesidade"]
    puts "#{intervalo_text}#{tab_intervalo_text}#{classificacao}#{tab_classificacao}#{grau_obesidade}"
end

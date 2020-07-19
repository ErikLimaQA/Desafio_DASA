Dado('que eu acesso a pagina principal') do
  visit 'https://dasa.com.br/'
end


Dado('seleciono {string}') do |link|
  link = page.first(:xpath, ".//a[contains(@href, '/marcas')]").click
end

Dado('informo os parametros de pesquisa {string}') do |regiao|
  click_link('open-close')
  regiao = find(:select, "region").first(:option, 'São Paulo').select_option
  expect(regiao).to have_content("São Paulo")
end
 
Quando('clico no {string} selecionado') do |laboratorio|
  laboratorio = page.first(:xpath, ".//a[contains(@data-node-id, '124')]").click
  
  #TODO
  #Pensar em uma assertiva melhor
  page.should have_content('Delboni Auriemo')
  sleep(5)
  
  #TODO
  #Verificar um outro metodo de seleção da opção
  
end

Então('carrega a pagina principal do {string}') do |lab_sel|
  #lab_sel = page.first(:xpath, ".//a[contains(., 'Delboni Auriemo')]").click
  page.should have_content('Delboni Auriemo')
  
  #variavel que recebe a nova janela
    new_tab = window_opened_by do
      page.first(:xpath, ".//a[contains(@href, 'delboni')]").click
      sleep(5)
    end
    
    #mudando o foco para a nova janela para captura da evidencia
    switch_to_window(new_tab)
    #expect(page).to have_current_path(Urls['https://delboniauriemo.com.br/'], url: true)
end
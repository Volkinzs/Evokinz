
---

# **GuiBase.lua Documentation (Complemento)**

---

## **Criando um Sector (`CreateSector`)**

A função `Tab:CreateSector()` cria um setor dentro de uma aba para organizar elementos.

### **Parâmetros**
```lua
local Sector = Tab:CreateSector({
   Title = "Título do Sector", -- (Obrigatório) Título do setor.
   Position = "left" -- (Opcional) Posição do setor ("left" ou "right").
})
```

### **Exemplo de Uso**
```lua
local Sector1 = Tab:CreateSector("Configurações Gerais", "left")
local Sector2 = Tab:CreateSector("Opções Avançadas", "right")
```

---

## **Adicionando um Dropdown (`AddDropdown`)**

A função `Sector:AddDropdown()` cria um dropdown (seletor de opções) dentro de um setor.

### **Parâmetros**
```lua
Sector:AddDropdown({
   Title = "Título do Dropdown", -- (Obrigatório) Título do dropdown.
   Options = {"Opção 1", "Opção 2", ...}, -- (Obrigatório) Lista de opções.
   DefaultValue = "Opção Padrão", -- (Opcional) Valor padrão selecionado.
   MultiSelect = false, -- (Opcional) Se verdadeiro, permite seleção múltipla.
   Callback = function(value) end -- (Obrigatório) Função chamada quando uma opção é selecionada.
})
```

### **Exemplo de Uso**
```lua
Sector:AddDropdown("MapSelection(AutoUpdate!)", MapSelection, "Mapa1", false, function(v)
    _G.MapSelection = v
end)

-- ou
Sector:AddDropdown({
   Title = "Selecionar Dificuldade",
   Options = {"Fácil", "Médio", "Difícil"},
   DefaultValue = "Fácil",
   MultiSelect = false,
   Callback = function(selectedOption)
       print("Opção selecionada:", selectedOption)
   end
})
```

---

## **Adicionando um Textbox (`AddTextbox`)**

A função `Sector:AddTextbox()` cria um campo de texto para entrada de dados.

### **Parâmetros**
```lua
Sector:AddTextbox({
   Title = "Título do Textbox", -- (Obrigatório) Título do campo.
   DefaultValue = "Valor Padrão", -- (Opcional) Valor inicial do campo.
   Callback = function(value) end -- (Obrigatório) Função chamada quando o valor é alterado.
})
```

### **Exemplo de Uso**
```lua
Sector:AddTextbox("Tempo de Espera (Apenas Número)", "10", function(text)
    _G.Cooldown = tonumber(text)
end)

-- ou
Sector:AddTextbox({
   Title = "Configurar Distância",
   DefaultValue = "5",
   Callback = function(value)
       print("Valor inserido:", value)
   end
})
```

---

## **Adicionando um Toggle (`AddToggle`)**

A função `Sector:AddToggle()` cria um interruptor (toggle) para ativar/desativar opções.

### **Parâmetros**
```lua
Sector:AddToggle({
   Title = "Título do Toggle", -- (Obrigatório) Título do toggle.
   DefaultValue = false, -- (Opcional) Estado inicial (true = ativo, false = inativo).
   Callback = function(state) end -- (Obrigatório) Função chamada quando o estado é alterado.
})
```

### **Exemplo de Uso**
```lua
Sector:AddToggle("Modo Automático", false, function(activated)
    _G.AutoPlay = activated
end)

-- ou
Sector:AddToggle({
   Title = "Dificuldade Hardcore",
   DefaultValue = true,
   Callback = function(enabled)
       print("Modo hardcore:", enabled)
   end
})
```

---

## **Adicionando um Botão (`AddButton`)**

A função `Sector:AddButton()` cria um botão que dispara uma ação quando clicado.

### **Parâmetros**
```lua
Sector:AddButton({
   Title = "Título do Botão", -- (Obrigatório) Texto do botão.
   Callback = function() end -- (Obrigatório) Função executada ao clicar no botão.
})
```

### **Exemplo de Uso**
```lua
Sector:AddButton("Salvar Configurações", function()
    -- Código para salvar configurações
    print("Configurações salvas!")
end)

-- ou
Sector:AddButton({
   Title = "Reiniciar",
   Callback = function()
       game.Players.LocalPlayer:Kick("Reiniciando...")
   end
})
```

---

## **Adicionando um Label (`AddLabel`)**

A função `Sector:AddLabel()` cria um rótulo de texto estático.

### **Parâmetros**
```lua
Sector:AddLabel({
   Text = "Texto do Label", -- (Obrigatório) Texto exibido.
   Bold = false -- (Opcional) Se verdadeiro, o texto é exibido em negrito.
})
```

### **Exemplo de Uso**
```lua
Sector:AddLabel("Instruções:", true) -- Texto em negrito
Sector:AddLabel("1. Selecione uma opção.")
Sector:AddLabel("2. Clique em 'Salvar'.")

-- ou
Sector:AddLabel({
   Text = "Opção Desativada",
   Bold = false
})
```


---

## **Criando um Separator (`AddSeparator`)**

A função `Sector:AddSeparator()` cria um separador visual dentro de um setor para dividir elementos.

### **Parâmetros**
```lua
Sector:AddSeparator({
   Title = "Título do Separador", -- (Opcional) Título do separador.
   Thickness = 1, -- (Opcional) Espessura do separador (padrão: 1).
   Color = Color3.fromRGB(100, 100, 100) -- (Opcional) Cor do separador.
})
```

### **Exemplo de Uso**
```lua
Sector:AddSeparator({
   Title = "Configurações Avançadas",
   Thickness = 2,
   Color = Color3.fromRGB(255, 0, 0)
})

-- ou
Sector:AddSeparator("Divisão")
```

---
## **Adicionando um Color Picker (`AddColorPicker`)**

A função `Sector:AddColorPicker()` cria um seletor de cor para escolher uma cor específica.

### **Parâmetros**
```lua
Sector:AddColorPicker({
   Title = "Título do Color Picker", -- (Obrigatório) Título do color picker.
   DefaultValue = Color3.fromRGB(255, 255, 255), -- (Opcional) Valor padrão da cor.
   Callback = function(color) end -- (Obrigatório) Função chamada quando a cor é selecionada.
})
```

### **Exemplo de Uso**
```lua
Sector:AddColorPicker("Cor do Fundo", Color3.fromRGB(255, 255, 255), function(color)
    _G.BackgroundColor = color
end)

-- ou
Sector:AddColorPicker({
   Title = "Cor do Texto",
   DefaultValue = Color3.fromRGB(0, 0, 0),
   Callback = function(selectedColor)
       print("Cor selecionada:", selectedColor)
   end
})
```

---

## **Adicionando um Keybind (`AddKeybind`)**

A função `Sector:AddKeybind()` cria um seletor de tecla para atribuir uma tecla específica a uma ação.

### **Parâmetros**
```lua
Sector:AddKeybind({
   Title = "Título do Keybind", -- (Obrigatório) Título do keybind.
   DefaultKey = Enum.KeyCode.Q, -- (Opcional) Tecla padrão (Enum.KeyCode).
   Callback = function(key) end -- (Obrigatório) Função chamada quando a tecla é pressionada.
})
```

### **Exemplo de Uso**
```lua
Sector:AddKeybind("Tecla de Salvar", Enum.KeyCode.S, function(key)
    print("Tecla pressionada:", key)
    -- Código para salvar configurações
end)

-- ou
Sector:AddKeybind({
   Title = "Tecla de Reiniciar",
   DefaultKey = Enum.KeyCode.R,
   Callback = function(pressedKey)
       print("Tecla reiniciar:", pressedKey)
       game.Players.LocalPlayer:Kick("Reiniciando...")
   end
})
```


---

## **Exemplo de Uso Completo com Todas as Funcionalidades**

```lua
-- Criando a janela
local Window = GuiBase:CreateWindow({
   Title = "Evokinz Hub",
   Theme = GuiBase.DefaultTheme,
   ConfigurationSaving = {
      Enabled = true,
      FileName = "EvokinzConfig"
   }
})

-- Criando uma aba
local Tab = Window:CreateTab({
   Title = "Configurações",
   Icon = 123456789
})

-- Criando setores dentro da aba
local Sector1 = Tab:CreateSector("Gerais", "left")
local Sector2 = Tab:CreateSector("Opções Avançadas", "right")

-- Adicionando elementos ao setor 1
Sector1:AddDropdown("Mapa", {"Mapa1", "Mapa2", "Mapa3"}, "Mapa1", false, function(v)
    _G.MapSelection = v
end)

Sector1:AddTextbox("Tempo de Espera (s)", "10", function(text)
    _G.Cooldown = tonumber(text)
end)

Sector1:AddToggle("Modo Automático", false, function(enabled)
    _G.AutoPlay = enabled
end)

-- Adicionando elementos ao setor 2
Sector2:AddButton("Salvar Configurações", function()
    print("Configurações salvas!")
end)

Sector2:AddLabel("Aviso:", true)
Sector2:AddLabel("Esta opção pode causar lag.")

-- Criando outra aba
local Tab2 = Window:CreateTab("Mais Opções")
local Sector3 = Tab2:CreateSector("Controle", "left")
Sector3:AddDropdown("Modo de Ataque", {"Ranged", "Melee"}, "Ranged", false, function(v)
    _G.AttackMode = v
end)

-- Destruindo a interface ao sair do jogo
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
    GuiBase:Destroy()
end)
```

---

### **Explicação dos Parâmetros **

#### **Exemplo de `AddDropdown` Completo**
```lua
Sector1:AddDropdown("MapSelection(AutoUpdate!)", MapSelection, false, false, function(v)
    _G.MapSelection = v
end)
```
- **Parâmetros**:
  - **"MapSelection(AutoUpdate!)"**: Título do dropdown.
  - **MapSelection**: Lista de opções (deve ser uma tabela de strings).
  - **false**: Nenhuma opção selecionada por padrão.
  - **false**: Seleção única (não múltipla).
  - **Callback**: Atualiza a variável global `_G.MapSelection` com a opção selecionada.

---

#### **Exemplo de `AddToggle` Completo**
```lua
Sector1:AddToggle("AutoPlay", false, function(t)
    _G.AutoPlay = t
end)
```
- **Parâmetros**:
  - **"AutoPlay"**: Título do toggle.
  - **false**: Estado inicial desativado.
  - **Callback**: Define a variável global `_G.AutoPlay` para o estado do toggle (true/false).

---

#### **Exemplo de `AddLabel` para Espaçamento**
```lua
Sector1:AddLabel("", true)
```
- **Parâmetros**:
  - **" "**: Texto vazio para criar um espaço.
  - **true**: Ignorado (pode ser usado para formatação, mas depende da implementação).

---

### **Créditos e Observações**
- **Autor**: Volkinzs (biblioteca `GuiBase.lua`).
- **Repositório**: [GitHub](https://github.com/Volkinzs/Evokinz).
- **Notas**:
  - Certifique-se de que as variáveis globais (`_G.MapSelection`, `_G.AutoPlay`, etc.) estão corretamente definidas em seu código.
  - Valide os valores de entrada em `AddTextbox` (ex: converter para número com `tonumber()`).
  - Para salvar configurações, use o sistema de salvamento integrado (`ConfigurationSaving`).


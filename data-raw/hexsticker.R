library(tidyverse)
library(rcis)
library(hexSticker)
library(here)
library(showtext)

font_add_google("Cormorant Garamond", "garamond")
showtext_auto()

p <- ggplot(data = scorecard,
            mapping = aes(x = type)) +
  geom_bar(fill = "#D6D6CE") +
  theme_void() +
  theme_transparent()
p

sticker(subplot = p, package = "rcis",
        h_color = "#767676", h_fill = "#B31B1B", p_color = "#222222",
        s_x = 1,
        s_width = 1, s_height = .8,
        filename = here("man", "figures", "logo.svg"))

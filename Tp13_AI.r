# Données fictives
groupe <- factor(c(rep("Groupe A", 3), rep("Groupe B", 3)))
condition <- rep(c("Condition 1", "Condition 2", "Condition 3"), 2)
valeurs <- c(10.2, 12.7, 9.8, 8.5, 11.3, 10.1)
erreurs <- c(0.8, 1.2, 0.6, 0.9, 1.1, 0.7)

# Couleurs pour les groupes
couleurs <- c("Groupe A" = "steelblue", "Groupe B" = "firebrick")

# Créer le graphique
plot(0, 0, type = "n", xlim = c(0.5, 3.5), ylim = c(min(valeurs - erreurs) - 1, max(valeurs + erreurs) + 1),
     xlab = "Condition expérimentale", ylab = "Valeur mesurée", xaxt = "n")

# Ajouter les barres d'erreur
arrows(x0 = rep(1:3, 2), y0 = valeurs - erreurs, y1 = valeurs + erreurs, angle = 90, code = 3, length = 0.1)

# Ajouter les barres
for (i in 1:length(valeurs)) {
  rect(xleft = which(condition == condition[i]) - 0.25 + (as.numeric(groupe[i]) - 1.5) * 0.25,
       ybottom = 0, xright = which(condition == condition[i]) + 0.25 + (as.numeric(groupe[i]) - 1.5) * 0.25,
       ytop = valeurs[i], col = couleurs[groupe[i]], border = "black")
}

# Ajouter les étiquettes des conditions
axis(1, at = 1:3, labels = levels(condition))

# Ajouter la légende
legend("topright", legend = levels(groupe), fill = couleurs, bty = "n")
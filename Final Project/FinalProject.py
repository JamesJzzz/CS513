# JKLB
# CS 513
# Final Project

from sklearn import tree, cluster
import numpy as np



def main():

    predicates = np.loadtxt("data/predicates.txt", dtype = str)
    animals = np.loadtxt("data/classes.txt", dtype = str)
    matrix = np.loadtxt("data/predicate-matrix-binary.txt", dtype = bool)

    pred = [(int(x), y, z) for x, y, z in predicates]
    inds = [x for x, _, _ in pred]
    preds = [z.replace("+", " ") for _, _, z in pred]

    anims = [(int(x), y) for x, y in animals]
    labelIndexes = [x for x, _ in anims]
    labels = [y.replace("+", " ") for _, y in anims]

    clf = tree.DecisionTreeClassifier()

    clf.fit(matrix, labelIndexes)

    node = 0

    while clf.tree_.feature[node] != -2:

        inp = ""
        yeasStr = ""
        naysStr = ""

        debug = True
        if debug:
            yeas = []
            nays = []
            for i in xrange(len(clf.tree_.value[node][0])):
                if clf.tree_.value[clf.tree_.children_left[node]][0][i] == 1:
                    nays += [labels[i]]
                elif clf.tree_.value[clf.tree_.children_right[node]][0][i] == 1:
                    yeas += [labels[i]]

            yeasStr = "\nAnimals where this is true:\n[" + ", ".join(yeas) + "]"
            naysStr = "\nAnimals where this is false:\n[" + ", ".join(nays) + "]"

        while inp != "Y" and inp != "N":
            inp = raw_input("\033[1m" + preds[clf.tree_.feature[node]] + "\033[0m\n" + yeasStr + "\n"+ naysStr + "\n\n\033[1mY/N:\033[0m\n").upper()
            if inp == "Y":
                node = clf.tree_.children_right[node]
            elif inp == "N":
                node = clf.tree_.children_left[node]
            else:
                print "Please enter only Y or N."

    finalInd = np.argmax(clf.tree_.value[node])
    print "Your animal was " + labels[finalInd] + "!"

    clusters = cluster.AgglomerativeClustering(12)
    c = clusters.fit_predict(matrix, labelIndexes)

    actualCluster = c[finalInd]
    thisCluster = []
    for animalInd in xrange(len(c)):
        if c[animalInd] == actualCluster and animalInd != finalInd:
            thisCluster += [labels[animalInd]]
    print "The other similar animals to yours were: "
    print ", ".join(thisCluster)

    return

if __name__ == "__main__":
    main()
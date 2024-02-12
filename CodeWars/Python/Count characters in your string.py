import codewars_test as test
from solution import count

@test.describe("Basic Tests")
def basic_tests():
    
    @test.it("Basic Tests")
    def basic_tests():
        test.assert_equals(count('aba'), {'a': 2, 'b': 1})
        test.assert_equals(count(''), {})
        test.assert_equals(count('aa'), {'a' : 2})
        test.assert_equals(count('aabb'), {'b' : 2, 'a' : 2})

def count(palavra):
    contagem_letras={}
        
    for letra in palavra:
        if letra in contagem_letras:
            contagem_letras[letra] += 1
        else:
            contagem_letras[letra] = 1
    
    return contagem_letras
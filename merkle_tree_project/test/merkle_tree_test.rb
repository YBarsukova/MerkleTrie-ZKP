require 'openssl'
require 'minitest/autorun'
require_relative '../src/merkle_tree'

class MerkleTreeTest < Minitest::Test
  def setup
    # Ожидаемые значения
    @expected_root2 = '33b675636da5dcc86ec847b38c08fa49ff1cace9749931e0a5d4dfdbdedd808a'
    @expected_root4 = '85df8945419d2b5038f7ac83ec1ec6b8267c40fdb3b1e56ff62f6676eb855e70'
    @expected_root8 = 'c27450cd3fd4df029145f3437ae9c381e0ae55e8400de06cb973005b36d7b222'
  end

  def test_merkle_tree_2
    leaves = [1, 2]
    tree = MerkleTree.new(leaves)
    root = tree.root
    assert_equal @expected_root2, root, "Root does not match for leaves [1, 2]"
  end

  def test_merkle_tree_4
    leaves = [1, 2, 3, 4]
    tree = MerkleTree.new(leaves)
    root = tree.root
    assert_equal @expected_root4, root, "Root does not match for leaves [1, 2, 3, 4]"
  end

  def test_merkle_tree_8
    leaves = [1, 2, 3, 4, 5, 6, 7, 8]
    tree = MerkleTree.new(leaves)
    root = tree.root
    assert_equal @expected_root8, root, "Root does not match for leaves [1, 2, 3, 4, 5, 6, 7, 8]"
  end
end

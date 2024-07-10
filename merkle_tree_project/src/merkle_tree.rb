require 'openssl'

class MerkleTree
  attr_reader :root

  def initialize(leaves)
    @leaves = leaves.map { |leaf| hash_leaf(leaf) }
    @root = build_tree(@leaves)
  end
  private

  def hash_leaf(leaf)
    digest = OpenSSL::Digest.new('SHA256')
    digest.update(leaf.to_s).digest.unpack1('H*')
  end

  def hash_pair(left, right)
    digest = OpenSSL::Digest.new('SHA256')
    digest.update(left + right).digest.unpack1('H*')
  end

  def build_tree(leaves)
    return leaves.first if leaves.size == 1

    next_level = []
    leaves.each_slice(2) do |left, right|
      right = left if right.nil?
      next_level << hash_pair(left, right)
    end

    build_tree(next_level)
  end
end

# Пример использования
leaves = [1, 2, 3, 4,5,6,7,8]
tree = MerkleTree.new(leaves)
puts "Merkle Root (Hex): #{tree.root}"

# Текстовое число
left = 'a'
right = 'b'
hash1 = OpenSSL::Digest.new('SHA256').update(left).digest.unpack1('H*')
puts hash1
hash2 = OpenSSL::Digest.new('SHA256').update(right).digest.unpack1('H*')
puts hash2
hash = OpenSSL::Digest.new('SHA256').update(hash1 + hash2).digest

hex_hash = hash.unpack1('H*')

# Вывод результата
puts "SHA256 Hash1 (Hex): #{hash1}"
puts "SHA256 Hash2 (Hex): #{hash2}"
puts "SHA256 Hash (Hex): #{hex_hash}"
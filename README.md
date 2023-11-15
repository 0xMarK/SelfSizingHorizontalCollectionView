# Self-sizing Horizontal UICollectionView

There is some kind of bug in `UICollectionView` which prevents the display of 1 self-sized cell in self-sized collection view with `estimatedItemSize` equal to `UICollectionViewFlowLayout.automaticSize`. `SelfSizingHorizontalCollectionView` overcomes this issue. The height of collection view correctly adjusts to the size of cells and it works for 1 cell too.

The intended `UICollectionView` should inherit `SelfSizingHorizontalCollectionView`. `SelfSizingHorizontalCollectionView` by default sets `collectionViewLayout` to `UICollectionViewFlowLayout()` with `scrollDirection` equal to `.horizontal`. Collection view should have **height constraint** which will be automatically found and modified by `SelfSizingHorizontalCollectionView`.

Collection view cell should have label with **Dynamic Type Font** and `adjustsFontForContentSizeCategory` equal to `true`. Or adjust it's height in some other way.

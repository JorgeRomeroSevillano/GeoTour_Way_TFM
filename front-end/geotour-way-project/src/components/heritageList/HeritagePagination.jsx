import { ChevronLeft, ChevronRight } from 'lucide-react'
import { useHeritageList } from '../../hooks/useHeritageList'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/HeritagePagination.css'

function HeritagePagination() {
  const {
    goToNextPageGroup,
    goToPreviousPageGroup,
    hasNextPageGroup,
    hasPreviousPageGroup,
    page,
    pageNumbers,
    setPage,
    totalResults,
  } = useHeritageList()
  const { t } = useLanguage()

  if (totalResults <= 9) {
    return null
  }

  return (
    <nav className="home__pagination" aria-label={t('home.pagination')}>
      {hasPreviousPageGroup && (
        <button
          type="button"
          className="home__page-button"
          aria-label={t('home.previousPages')}
          onClick={goToPreviousPageGroup}
        >
          <ChevronLeft size={20} strokeWidth={3} aria-hidden="true" />
        </button>
      )}
      {pageNumbers.map((pageNumber) => (
        <button
          key={pageNumber}
          type="button"
          className={
            pageNumber === page
              ? 'home__page-button home__page-button--active'
              : 'home__page-button'
          }
          onClick={() => setPage(pageNumber)}
        >
          {pageNumber}
        </button>
      ))}
      {hasNextPageGroup && (
        <button
          type="button"
          className="home__page-button"
          aria-label={t('home.nextPages')}
          onClick={goToNextPageGroup}
        >
          <ChevronRight size={20} strokeWidth={3} aria-hidden="true" />
        </button>
      )}
    </nav>
  )
}

export default HeritagePagination
